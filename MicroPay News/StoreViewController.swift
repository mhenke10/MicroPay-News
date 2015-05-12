//
//  StoreViewController.swift
//  MicroPay News
//
//  Created by Group 1.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var storeButton: UIBarButtonItem!
    
    @IBOutlet weak var tokenCounter: UILabel!
    
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

    
    @IBAction func tenTokens(sender: AnyObject) {

        var alert = UIAlertController(title: "Do you want to purchase 10 Tokens?", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes!", style:UIAlertActionStyle.Default, handler:{(alert: UIAlertAction!) in NewsArticle.counter = NewsArticle.counter + 10
            
            self.tokenCounter.text = (NewsArticle.counter).description}))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        //self.tokenCounter.text = (NewsArticle.counter).description
        
    }
    
    
    @IBAction func twentyTokens(sender: AnyObject) {
        var alert = UIAlertController(title: "Do you want to purchase 20 Tokens?", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes!", style:UIAlertActionStyle.Default, handler:{(alert: UIAlertAction!) in NewsArticle.counter = NewsArticle.counter + 20
            
            self.tokenCounter.text = (NewsArticle.counter).description}))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        //tokenCounter.text = (NewsArticle.counter+20).description
        
    }
    
    
    @IBAction func thirtyTokens(sender: AnyObject) {
        var alert = UIAlertController(title: "Do you want to purchase 30 Tokens?", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes!", style:UIAlertActionStyle.Default, handler:{(alert: UIAlertAction!) in NewsArticle.counter = NewsArticle.counter + 30
            
            self.tokenCounter.text = (NewsArticle.counter).description}))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        //self.tokenCounter.text = (NewsArticle.counter).description
        
    }
    
    

}
