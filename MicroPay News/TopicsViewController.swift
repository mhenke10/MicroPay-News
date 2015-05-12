//
//  TopicsViewController.swift
//  MicroPay News
//
//  Created by Michael Henke on 5/10/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class TopicsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var topicsPageTable: UITableView!
    @IBOutlet weak var tokenCounter: UILabel!
    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183802"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //calling function from App Delegate to try and change the title of view controller
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let topicData = appDelegate.getTopicData()
        
        //This is the counter
        self.tokenCounter.text = (NewsArticle.counter).description
        
        //loading parser
        newsStory.load(newsSourceURL) {
            (ns, errorStr) -> Void in
            if let errorString = errorStr {
                println(errorString)
            } else {
                //println("No Error")
                self.topicsPageTable.reloadData()
            }
        }
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsStory.stories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        //Trying to get this to work. If the headline is sports, print only the sports stories. but I don't know.
        /**
        if(newsStory.stories[indexPath.row].sectHed == "Sports"){
            cell.textLabel?.text = newsStory.stories[indexPath.row].headline
        }
        **/
        
        cell.textLabel?.text = newsStory.stories[indexPath.row].headline
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
