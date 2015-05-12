//
//  PurchasedPageViewController.swift
//  MicroPay News
//
//  Created by Michael Henke on 4/14/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class PurchasedPageViewController: UIViewController//, UITableViewDataSource, UITableViewDelegate 
{
    let cellIdentifier = "cell"
    let sitePrefix = "http://www.columbiamissourian.com/a/188667/"
    
    @IBOutlet weak var articleButton: UIBarButtonItem!
    
    @IBOutlet weak var tokenCounter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Articles"
        
        self.tokenCounter.text = (NewsArticle.counter).description
        
        articleButton.enabled = false
        // Do any additional setup after loading the view.
    }

    @IBAction func returnHome(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
