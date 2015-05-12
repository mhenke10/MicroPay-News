//
//  HomePage.swift
//  MicroPay News
//
//  Created by Michael Henke on 4/21/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class HomePage: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    //declaring variables
    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183802"

    //IBOutlets for counter and tableview
    @IBOutlet weak var homeCounter: UILabel!
    //@IBOutlet weak var homePageTable: UITableView!
    @IBOutlet weak var homePageButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MicroPay News"
        homePageButton.enabled = false
        
        //changes what the 'Back' Button would be when changing view controllers
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        
        //Next part is the notification with counter implemented. Going to add this once we figure out the rest of the stuff.
        
        
        var alert = UIAlertController(title: "Confirm?", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Unlock", style:UIAlertActionStyle.Default, handler:{(alert: UIAlertAction!) in self.homeCounter.text = (--NewsArticle.counter).description}))

        self.presentViewController(alert, animated: true, completion: nil)
        
        
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
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //function from app delegate to get the amount of sections in table view
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let topicData = appDelegate.getTopicData()
        
        return topicData.topics!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let topicData = appDelegate.getTopicData()
        
        //this is the same setup as what was in the NYT News Reader app
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        let topicsText = topicData.topics![indexPath.row]
        
        cell.textLabel?.text = topicsText.topic
        
        //cell.textLabel?.text = newsStory.stories[indexPath.row].sectHed
        //cell.detailTextLabel?.text = newsStory.stories[indexPath.row].sectHed
        
        return cell
        
    }
    
    //I think here we may be able to tell it to change the new views name. But I'm unsure
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let topicData = appDelegate.getTopicData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}