//
//  NewsStories.swift
//  Missourian
//
//  Created by Group 1.
//  Copyright (c) 2015 Dale Musser. All rights reserved.
//

import UIKit

class NewsStories: NSObject {
    var stories = Array<NewsArticle>()
    
    func load(fromURLString: String, completionHandler: (NewsStories, String?) -> Void) {
        stories = Array<NewsArticle>()
        if let url = NSURL(string: fromURLString) {
            let urlRequest = NSMutableURLRequest(URL: url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(urlRequest, completionHandler: {
                (data, response, error) -> Void in
                if error != nil {
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(self, error.localizedDescription)
                    })
                } else {
                    self.parse(data, completionHandler: completionHandler)
                }
            })
            
            task.resume()
        } else {
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(self, "Invalid URL")
            })
        }
    }
    
    private func parse(jsonData: NSData, completionHandler: (NewsStories, String?) -> Void) {
        //println(jsonData)
        var jsonError: NSError?
        
        if let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSArray {
            if (jsonResult.count > 0) {
                for item in jsonResult {
                    var itemDict = item as! NSDictionary
                    var itemValues = itemDict.allValues as NSArray
                    if (itemValues.count > 0) {
                        var story = itemValues[0] as! NSDictionary
                        if let body = story["body"] as? String {
                            if let pubTime = story["pub_time"] as? String {
                                if let deck = story["deck"] as? String {
                                    if let headline = story["headline"] as? String {
                                        if let excerpt = story["excerpt"] as? String {
                                            if let slug = story["slug"] as? String {
                                                if let score = story["score"] as? Int {
                                                    if let createdTime = story["created_time"] as? String {
                                                        if let sectHed = story["sect_hed"] as? String {
                                                            if let id = story["id"] as? Int {
                                                                let newsStory = NewsArticle()
                                                                newsStory.body = body
                                                                newsStory.pubTime = pubTime
                                                                newsStory.deck = deck
                                                                newsStory.headline = headline
                                                                newsStory.excerpt = excerpt
                                                                newsStory.slug = slug
                                                                newsStory.score = score
                                                                newsStory.createdTime = createdTime
                                                                newsStory.sectHed = sectHed
                                                                newsStory.id = id
                                                                stories.append(newsStory)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                // return the results
                dispatch_async(dispatch_get_main_queue(), {
                   completionHandler(self, nil)
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(self, "No results found.")
                })
            }

        } else {
            if let unwrappedError = jsonError {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(self, "\(unwrappedError)")
                })
            }
        }
    }
    
}
