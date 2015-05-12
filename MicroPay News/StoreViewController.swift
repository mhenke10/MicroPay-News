//
//  StoreViewController.swift
//  MicroPay News
//
//  Created by Michael Henke on 5/7/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var storeButton: UIBarButtonItem!
    
    @IBOutlet weak var tokenCounter: UILabel!
    
    @IBOutlet weak var tokenTableView: UITableView!
    
    var tokenOptions: [String] = ["10 Tokens", "30 Tokens", "50 Tokens", "Monthly Subscription"]
    
    @IBAction func returnHome(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Store"
        
        //changes the 'Back' button to 'Store' when changing view controllers
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Store", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        
        //makes button unclickable when on page. Don't want a user to be able to click on the store page when on the store page.
        storeButton.enabled = false
        
        //this is for the counter
        self.tokenCounter.text = (NewsArticle.counter).description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        
        return self.tokenOptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tokenTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as!UITableViewCell
        
        cell.textLabel?.text = tokenOptions[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        println("Row \(indexPath.row) selected.")
        
    }

}
