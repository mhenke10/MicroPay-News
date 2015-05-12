//
//  PurchasedPageViewController.swift
//  MicroPay News
//
//  Created by Michael Henke on 4/14/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class PurchasedPageViewController: UIViewController//, UITableViewDataSource, UITableViewDelegate 
{
    let cellIdentifier = "cell"

    let sitePrefix = "http://www.columbiamissourian.com/a/"
    
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183900"
    var purchasedStories: Array<NewsArticle> = []
    
    @IBOutlet weak var articleButton: UIBarButtonItem!
    
    @IBOutlet weak var tokenCounter: UILabel!
 
    var articleFilePath: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Articles"

        let fileManager = NSFileManager.defaultManager()
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDir = directoryPaths[0] as! String
        articleFilePath = documentDir.stringByAppendingPathComponent("purchased.archive")
        
        //loading parser
        newsStory.load(newsSourceURL) {
            (ns, errorStr) -> Void in
            if let errorString = errorStr {
                println(errorString)
            } else {
                //println("No Error")
                //self.homePageTable.reloadData()
            }
        }
        
        if fileManager.fileExistsAtPath(articleFilePath!) {
            let purchasedDataArray = NSKeyedUnarchiver.unarchiveObjectWithFile(articleFilePath!) as! [Int]
            for story in newsStory.stories {
                for purchases in purchasedDataArray {
                    if purchases == story.id {
                        purchasedStories.append(story)
                    }
                }
            }
        }
        
        self.tokenCounter.text = (NewsArticle.counter).description
        
        articleButton.enabled = false
    }

    @IBAction func returnHome(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
