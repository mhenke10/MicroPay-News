//
//  NewsArticle.swift
//  MicroPay News
//
//  Created by Michael Henke on 4/21/15.
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

    var topics: [topicData]?
    
    let stateNews = topicData(topic: "State News")
    let news = topicData(topic: "News")
    let obituaries = topicData(topic: "Family Obituaries")
    let local = topicData(topic: "Local News")
    let sports = topicData(topic: "Sports")
    
    override init(){
        topics = [stateNews, news, obituaries, local, sports]
    }
    
}

class Purchased: NSObject{
    var id: Int = 0
    var purchase: Bool = false
}