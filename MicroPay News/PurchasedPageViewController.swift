//
//  PurchasedPageViewController.swift
//  MicroPay News
//
//  Created by Michael Henke on 4/14/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class PurchasedPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let sitePrefix = "http://www.columbiamissourian.com/a/"
    
    @IBOutlet weak var purchasedTable: UITableView!
    
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
                if fileManager.fileExistsAtPath(self.articleFilePath!) {
                    let purchasedDataArray = NSKeyedUnarchiver.unarchiveObjectWithFile(self.articleFilePath!) as! [Int]
                    for story in self.newsStory.stories {
                        for purchases in purchasedDataArray {
                            if purchases == story.id {
                                self.purchasedStories.append(story)
                            }
                        }
                    }
                }
                
                self.purchasedTable.reloadData()
            }
            
            println("Hello")
        }
        
        self.tokenCounter.text = (NewsArticle.counter).description
        
        articleButton.enabled = false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchasedStories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = purchasedStories[indexPath.row].headline
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println( purchasedStories[indexPath.row].headline)
        article = purchasedStories[indexPath.row]
        performSegueWithIdentifier("webSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is ArticleViewController {
            let destinationViewController = segue.destinationViewController as! ArticleViewController
            
            destinationViewController.webArticles = article
        }
    }
    
    @IBAction func returnHome(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
