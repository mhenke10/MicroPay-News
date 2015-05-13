//
//  WorldNews.swift
//  MicroPay News
//
//  Created by Group 1.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class WorldNews: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //declaring variables
    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183900"
    
    var worldStories: Array<NewsArticle> = []
    
    @IBOutlet weak var worldNewsTable: UITableView!
    
    @IBOutlet weak var tokenCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "World News"
        
        
        newsStory.load(newsSourceURL) {
            (ns, errorStr) -> Void in
            if let errorString = errorStr {
                println(errorString)
            } else {
                
                let stories = self.newsStory.stories
                
                self.worldStories = stories.filter { $0.sectHed == "News"}
                
                self.worldNewsTable.reloadData()
            }
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tokenCounter.text = (NewsArticle.counter).description
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldStories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //this is the same setup as what was in the NYT News Reader app
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = worldStories[indexPath.row].headline
        //cell.detailTextLabel?.text = newsStory.stories[indexPath.row].sectHed
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is ArticleViewController {
            let destinationViewController = segue.destinationViewController as! ArticleViewController
            
            destinationViewController.webArticles = article
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        article = worldStories[indexPath.row]
        performSegueWithIdentifier("webSegue", sender: self)
        worldNewsTable.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnHome(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
