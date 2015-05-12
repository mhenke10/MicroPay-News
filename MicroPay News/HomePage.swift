//
//  HomePage.swift
//  MicroPay News
//
//  Created by Group 1.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class HomePage: UIViewController
{

    //declaring variables
    var cellIden = "cell"
    var article: NewsArticle?
    var newsStory: NewsStories = NewsStories()
    var newsSourceURL = "http://dalemusser.com/missourian/data.json"

    //IBOutlets for counter and tableview
    @IBOutlet weak var tokenCounter: UILabel!
    //@IBOutlet weak var homePageTable: UITableView!
    @IBOutlet weak var homePageButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MicroPay News"
        homePageButton.enabled = false
        
        //changes what the 'Back' Button would be when changing view controllers
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
    
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tokenCounter.text = (NewsArticle.counter).description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}