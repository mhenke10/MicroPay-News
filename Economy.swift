//
//  Economy.swift
//  MicroPay News
//
//  Created by Michael Henke on 5/11/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class Economy: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //declaring variables
    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://ec2-52-11-214-35.us-west-2.compute.amazonaws.com:5050/data?ids=183762,183900"
    
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
                //println("No Error")
                let stories = self.newsStory.stories
                for story in stories{
                let economyStories = stories.filter(){
                        let sectHed = ($0.sectHed as String?)
                            if sectHed == "Economy"{
                                print(sectHed!)
                                print("\n")
                                return true
                            } else {
                                return false
                            }
                    }
                }
                self.economyTable.reloadData()
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
        
        //this is the same setup as what was in the NYT News Reader app
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = newsStory.stories[indexPath.row].headline
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
