//
//  Economy.swift
//  MicroPay News
//
//  Created by Group 1.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class Economy: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //declaring variables
    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183900"
    
    var economyStories: Array<NewsArticle> = []
    
    @IBOutlet weak var economyTable: UITableView!
    
    @IBOutlet weak var tokenCounter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Economy"
        self.tokenCounter.text = (NewsArticle.counter).description
        
        newsStory.load(newsSourceURL) {
            
            (ns, errorStr) -> Void in
            if let errorString = errorStr {
                println(errorString)
            } else {
                
                let stories = self.newsStory.stories
                
                self.economyStories = stories.filter { $0.sectHed == "Economy"}
            
            }
                self.economyTable.reloadData()
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return economyStories.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        article = economyStories[indexPath.row]
        performSegueWithIdentifier("webSegue", sender: self)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = economyStories[indexPath.row].headline
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is ArticleViewController {
            let destinationViewController = segue.destinationViewController as! ArticleViewController
            
            destinationViewController.webArticles = article
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnHome(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
