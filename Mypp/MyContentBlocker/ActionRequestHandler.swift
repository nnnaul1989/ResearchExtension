//
//  ActionRequestHandler.swift
//  MyContentBlocker
//
//  Created by NUS on 11/3/15.
//  Copyright © 2015 NUS. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        let attachment = NSItemProvider(contentsOfURL: NSBundle.mainBundle().URLForResource("blockerList", withExtension: "json"))!
    
        let item = NSExtensionItem()
        item.attachments = [attachment]
        NSLog(">>>>>>>>>>>>>")
        context.completeRequestReturningItems([item], completionHandler: nil);
    }
    
}
