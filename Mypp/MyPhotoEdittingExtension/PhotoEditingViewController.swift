//
//  PhotoEditingViewController.swift
//  MyPhotoEdittingExtension
//
//  Created by NUS on 11/3/15.
//  Copyright © 2015 NUS. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

import ImageProcessingKit

class PhotoEditingViewController: UIViewController, PHContentEditingController {

    var input: PHContentEditingInput?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addFilterButton: UIButton!
    
    var processedImage: UIImage?
    let processor = ImageProcessor()
    
    @IBAction func cancel(sender: UIButton) {
        if let input = input {
            imageView.image = input.displaySizeImage
            processedImage = nil
        }
    }
    
    @IBAction func addFilter(sender: UIButton) {
        if let input = input {
            processedImage = processor.processImage(input.displaySizeImage!)
            imageView.image = processedImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - PHContentEditingController

    func canHandleAdjustmentData(adjustmentData: PHAdjustmentData?) -> Bool {
        // Inspect the adjustmentData to determine whether your extension can work with past edits.
        // (Typically, you use its formatIdentifier and formatVersion properties to do this.)
        return false
    }

    func startContentEditingWithInput(contentEditingInput: PHContentEditingInput?, placeholderImage: UIImage) {
        // Present content for editing, and keep the contentEditingInput for use when closing the edit session.
        // If you returned true from canHandleAdjustmentData:, contentEditingInput has the original image and adjustment data.
        // If you returned false, the contentEditingInput has past edits "baked in".
        input = contentEditingInput
        if let input = contentEditingInput {
            imageView.image = input.displaySizeImage
        }
    }

    func finishContentEditingWithCompletionHandler(completionHandler: ((PHContentEditingOutput!) -> Void)!) {
        // Update UI to reflect that editing has finished and output is being rendered.
        
//        // Render and provide output on a background queue.
//        dispatch_async(dispatch_get_global_queue(CLong(DISPATCH_QUEUE_PRIORITY_DEFAULT), 0)) {
//            // Create editing output from the editing input.
//            let output = PHContentEditingOutput(contentEditingInput: self.input!)
//            
//            // Provide new adjustments and render output to given location.
//            // output.adjustmentData = <#new adjustment data#>
//            // let renderedJPEGData = <#output JPEG#>
//            // renderedJPEGData.writeToURL(output.renderedContentURL, atomically: true)
//            
//            // Call completion handler to commit edit to Photos.
//            completionHandler?(output)
//            
//            // Clean up temporary files, etc.
//        }
        
        if input == nil {
            self.cancelContentEditing()
            return
        }
        
        dispatch_async(dispatch_get_global_queue(CLong(DISPATCH_QUEUE_PRIORITY_DEFAULT), 0)) {
            let contentEditingOutput = PHContentEditingOutput(contentEditingInput: self.input!)
            
            let archiveData = NSKeyedArchiver.archivedDataWithRootObject("Face Blur")
            let identifier = "com.appcoda.FaceBlur.FaceBlur-filter"
            let adjustmentData = PHAdjustmentData(formatIdentifier: identifier, formatVersion: "1.0", data: archiveData)
            contentEditingOutput.adjustmentData = adjustmentData
            
            if let path = self.input!.fullSizeImageURL!.path {
                var image = UIImage(contentsOfFile: path)!
                image = self.processor.processImage(image)
                
                let jpegData = UIImageJPEGRepresentation(image, 1.0)
                
                do {
                    try jpegData?.writeToURL(contentEditingOutput.renderedContentURL, options: .DataWritingAtomic)
                    
                    completionHandler(contentEditingOutput)

                }catch{
                    NSLog("Save error \(error)")
                    completionHandler(nil)
                }
                
            } else {
                NSLog("Load error")
                completionHandler(nil)
            }
        }
    }

    var shouldShowCancelConfirmation: Bool {
        // Determines whether a confirmation to discard changes should be shown to the user on cancel.
        // (Typically, this should be "true" if there are any unsaved changes.)
        return false
    }

    func cancelContentEditing() {
        // Clean up temporary files, etc.
        // May be called after finishContentEditingWithCompletionHandler: while you prepare output.
    }

}
