//
//  ImageProcessor.swift
//  FaceBlur
//
//  Created by Joyce Echessa on 11/14/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

import UIKit

public class ImageProcessor {
    
    public init() {
        
    }
    
    public func processImage(image: UIImage) -> UIImage {
        let inputImage: CIImage = CIImage(image: image)!
        
        let detector: CIDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: nil)
        
        let faces = detector.featuresInImage(inputImage)
        
        var mask: CIImage!
        
        if faces.count > 0 {
            var filteredImage: UIImage!
            
            for face in faces {
                let centerX = face.bounds.origin.x + face.bounds.size.width / 2.0
                let centerY = face.bounds.origin.y + face.bounds.size.height / 2.0
                let radius = min(face.bounds.size.width, face.bounds.size.height) / 1.5
                
                let radialGradient = CIFilter(name: "CIRadialGradient")
                radialGradient!.setValuesForKeysWithDictionary(["inputRadius0": radius,
                    "inputRadius1": radius + 1.0,
                    "inputColor0": CIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
                    "inputColor1": CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0),
                    kCIInputCenterKey: CIVector(x: centerX, y: centerY)])
                
                let circle = radialGradient!.outputImage
                
                if mask != nil {
                    let imageFilter = CIFilter(name: "CIAdditionCompositing")
                    imageFilter!.setValuesForKeysWithDictionary([kCIInputImageKey: circle!, kCIInputBackgroundImageKey:mask!])
                    mask = imageFilter!.outputImage
                    
                } else {
                    mask = circle
                }
                
                let filter = CIFilter(name: "CIPixellate")
                filter!.setValuesForKeysWithDictionary([kCIInputImageKey: inputImage, "inputScale":10.0])
                let pixelImage = filter!.outputImage
                let outputFilter = CIFilter(name: "CIBlendWithMask")
                outputFilter!.setValuesForKeysWithDictionary([kCIInputImageKey: pixelImage!, kCIInputBackgroundImageKey: inputImage, kCIInputMaskImageKey: mask!])
                
                let outputImage = outputFilter!.outputImage
                let context = CIContext(options: nil)
                let imageRef = context.createCGImage(outputImage!, fromRect: outputImage!.extent)
                filteredImage = UIImage(CGImage: imageRef)
            }
            return filteredImage
        } else {
            return image
        }
    }
    
}

