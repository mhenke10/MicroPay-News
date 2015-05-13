//
//  ColumbiaNews.swift
//  MicroPay News
//
//  Created by Group 1.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class ColumbiaNews: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //declaring variables
    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183900"
    
    var junkStories: Array<NewsArticle> = []
    var columbiaStories: Array<NewsArticle> = []
    
    @IBOutlet weak var columbiaNewsTable: UITableView!
    
    @IBOutlet weak var tokenCounter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Columbia News"
        
        
        newsStory.load(newsSourceURL) {
            (ns, errorStr) -> Void in
            if let errorString = errorStr {
                println(errorString)
            } else {
                
                let stories = self.newsStory.stories
                
                self.junkStories = stories.filter { $0.sectHed == "Local"}
                
                self.columbiaStories += self.junkStories
                
                self.junkStories = stories.filter { $0.sectHed == "Family Obituaries"}
                
                self.columbiaStories += self.junkStories
                
                self.junkStories = stories.filter { $0.sectHed == "Higher Education"}
                
                self.columbiaStories += self.junkStories
                
                self.junkStories = stories.filter { $0.sectHed == "Opinion"}
                
                self.columbiaStories += self.junkStories
                
                self.columbiaNewsTable.reloadData()
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
        return columbiaStories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //this is the same setup as what was in the NYT News Reader app
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = columbiaStories[indexPath.row].headline
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.destinationViewController is ArticleViewController {
            let destinationViewController = segue.destinationViewController as! ArticleViewController
            
            destinationViewController.webArticles = article
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        article = columbiaStories[indexPath.row]
        performSegueWithIdentifier("webSegue", sender: self)
        columbiaNewsTable.deselectRowAtIndexPath(indexPath, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func returnHome(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
