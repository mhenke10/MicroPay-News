//
//  ArticleViewController.swift
//  MicroPay News
//
//  Created by Group 1.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    var webArticles: NewsArticle?
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var webArticle: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let article = webArticles {
            
            let siteAffix = article.id
            let string = "http://www.columbiamissourian.com/a/\(siteAffix)"
            var flag = false
            
            if let load = NSURL(string: string) {
                let loadRequest = NSMutableURLRequest(URL: load)
                webArticle.loadRequest(loadRequest)
                
                let fileManager = NSFileManager.defaultManager()
                let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
                let documentDir = directoryPaths[0] as! String
                var articleFilePath = documentDir.stringByAppendingPathComponent("purchased.archive")
                
                
                if fileManager.fileExistsAtPath(articleFilePath) {
                    let purchasedDataArray = NSKeyedUnarchiver.unarchiveObjectWithFile(articleFilePath) as! [Int]
                    
                    for purchases in purchasedDataArray {
                        if purchases == webArticles?.id {
                            flag = true
                        }
                    }
                }
            }
            
            if flag {
                webArticle.scrollView.scrollEnabled = true
                self.blurView.hidden = true
            } else {
                webArticle.scrollView.scrollEnabled = false
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
    
    @IBAction func purchaseArticle(sender: AnyObject) {
        var alert = UIAlertController(title: "Do you want to purchase this article for 1 token?", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes!", style:UIAlertActionStyle.Default, handler:{(alert: UIAlertAction!) in NewsArticle.counter = NewsArticle.counter - 1
        
            let fileManager = NSFileManager.defaultManager()
            let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            let documentDir = directoryPaths[0] as! String
            var articleFilePath = documentDir.stringByAppendingPathComponent("purchased.archive")
            var array: [Int] = []
            
            if fileManager.fileExistsAtPath(articleFilePath) {
                var articleDataArray = NSKeyedUnarchiver.unarchiveObjectWithFile(articleFilePath) as! [Int]
                array += articleDataArray
            }
            
            array.append( self.webArticles!.id)
            NSKeyedArchiver.archiveRootObject(array, toFile: articleFilePath)
            
            self.webArticle.scrollView.scrollEnabled = true
            
            self.blurView.hidden = true
            
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

}