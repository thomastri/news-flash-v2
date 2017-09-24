//
//  Article.swift
//  NewsFlash
//
//  Created by Thomas Le on 9/24/17.
//  Copyright © 2017 Thomas Le. All rights reserved.
//

import Foundation
import ObjectMapper

class Article : Mappable {

    var title : String = ""
    var imageURL : String = ""
    var url : String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    // maps news API json to objects
    func mapping(map: Map) {
        title <- map["title"]
        imageURL <- map["urlToImage"]
        url <- map["url"]
    }
}
