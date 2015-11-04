//
//  RequestHandler.swift
//  MySharedLinksExtension
//
//  Created by NUS on 11/3/15.
//  Copyright © 2015 NUS. All rights reserved.
//

import Foundation

class RequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        let extensionItem = NSExtensionItem()
        
        // The keys of the user info dictionary match what data Safari is expecting for each Shared Links item.
        // For the date, use the publish date of the content being linked
        extensionItem.userInfo = [
            "uniqueIdentifier": "1234",
            "urlString": "https://www.nustechnology.com/",
            "date": NSDate(),
            "displayName": "NUS FC" 
        ]
        
        extensionItem.attributedTitle = NSAttributedString(string: "NUS Tech")
        extensionItem.attributedContentText = NSAttributedString(string: "NUS Technology offers leading edge web and mobile software development services, as well as project management and product management. We proudly serve a diverse group of clients across the globe, from small businesses to large corporations.")
        
        // You can supply a custom image to be used with your link as well. Use the NSExtensionItem's attachments property.
        extensionItem.attachments = [
            NSItemProvider(contentsOfURL: NSBundle.mainBundle().URLForResource("icon", withExtension: "jpg"))!,
        ]
        
        let bundle = NSBundle.mainBundle()
        let iconURL = bundle.URLForResource("right", withExtension: "jpg")
        extensionItem.attachments = [ NSItemProvider(contentsOfURL: iconURL )! ]

        context.completeRequestReturningItems([extensionItem], completionHandler: nil)
    }

}
