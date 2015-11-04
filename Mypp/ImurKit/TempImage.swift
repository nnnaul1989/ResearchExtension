//
//  TempImage.swift
//  ImgurShare
//
//  Created by Joyce Echessa on 3/29/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import Foundation

public class TempImage {
    
    public var imgurId: String
    public var title: String
    public var link: NSURL?
    
    public init(fromJson json: JSON) {
        imgurId = json["id"].string!
        title = json["title"].string ?? ""
        let urlString = json["link"].string!
        if let link = NSURL(string: urlString) {
            self.link = link
        }
    }
    
}