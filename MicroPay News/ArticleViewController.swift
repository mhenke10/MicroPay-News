//
//  ArticleViewController.swift
//  MicroPay News
//
//  Created by Admin on 5/12/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    var webArticles: NewsArticle?
    
    @IBOutlet weak var webArticle: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let article = webArticles {
            
            let siteAffix = article.id
            let string = "http://www.columbiamissourian.com/a/\(siteAffix)"
            
            if let load = NSURL(string: string) {
                let loadRequest = NSMutableURLRequest(URL: load)
                webArticle.loadRequest(loadRequest)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}