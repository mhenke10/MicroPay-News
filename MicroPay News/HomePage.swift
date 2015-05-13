//
//  HomePage.swift
//  MicroPay News
//
//  Created by Group 1.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class HomePage: UIViewController
{

    //declaring variables
    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183900"

    //IBOutlets for counter and tableview
    @IBOutlet weak var tokenCounter: UILabel!
    //@IBOutlet weak var homePageTable: UITableView!
    @IBOutlet weak var homePageButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MicroPay News"
        homePageButton.enabled = false
        
        //changes what the 'Back' Button would be when changing view controllers
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        
        let fileManager = NSFileManager.defaultManager()
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDir = directoryPaths[0] as! String
        var tokensFilePath = documentDir.stringByAppendingPathComponent("tokens.archive")
        
        if fileManager.fileExistsAtPath(tokensFilePath) {
            let tokenArray = NSKeyedUnarchiver.unarchiveObjectWithFile(tokensFilePath) as! [Int]
            for value in tokenArray {
                NewsArticle.counter = value
            }
        } else {
            NewsArticle.counter = 10
        }
    
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tokenCounter.text = (NewsArticle.counter).description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}