//
//  MissouriNews.swift
//  MicroPay News
//
//  Created by Michael Henke on 5/11/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class MissouriNews: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183900"
    
    var purchasedFilePath: String?
    
    var missouriStories: Array<NewsArticle> = []
    
    @IBOutlet weak var missouriNewsTable: UITableView!
    
    @IBOutlet weak var tokenCounter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Missouri News"
        self.tokenCounter.text = (NewsArticle.counter).description
        
        newsStory.load(newsSourceURL) {
            (ns, errorStr) -> Void in
            if let errorString = errorStr {
                println(errorString)
            } else {
                
                let stories = self.newsStory.stories
                
                self.missouriStories = stories.filter { $0.sectHed == "State News"}

                //println("No Error")
                self.missouriNewsTable.reloadData()
            }
        }
        
    }
    
    /*@IBAction func save(sender: AnyObject) {
                let fileManager = NSFileManager.defaultManager()
                var array: [String] = []
                
                if fileManager.fileExistsAtPath(purchasedFilePath!) {
                    var purchasedFilePath = NSKeyedUnarchiver.unarchiveObjectWithFile(personFilePath!) as! [String]
                    array += purchasedFilePath
                }
                
                
                let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
                let documentDir = directoryPaths[0] as! String
                purchasedFilePath = documentDir.stringByAppendingPathComponent("purchased.archive")
                var purchasedDataArray = array + ["id"]
                NSKeyedArchiver.archiveRootObject(purchasedDataArray, toFile: purchasedFilePath!)
    }*/
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return missouriStories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //this is the same setup as what was in the NYT News Reader app
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = missouriStories[indexPath.row].headline

        //cell.detailTextLabel?.text = newsStory.stories[indexPath.row].sectHed
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnHome(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }


}
