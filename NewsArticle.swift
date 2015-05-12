//
//  NewsArticle.swift
//  MicroPay News
//
//  Created by Group 1.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import Foundation
import UIKit

struct topicData{
    var topic: String
}

class NewsArticle: NSObject{
    var body: String = ""
    var pubTime: String = ""
    var deck: String = ""
    var headline: String = ""
    var excerpt: String = ""
    var slug: String = ""
    var score: Int = 0
    var createdTime: String = ""
    var sectHed: String = ""
    var id: Int = 0
    static var counter: Int = 10
    
}

class Purchased: NSObject{
    var id: Int = 0
    var purchase: Bool = false
}