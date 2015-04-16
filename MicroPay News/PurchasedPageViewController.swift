//
//  PurchasedPageViewController.swift
//  MicroPay News
//
//  Created by Michael Henke on 4/14/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class PurchasedPageViewController: UIViewController {

    @IBOutlet weak var backButton: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        var navigationBarAppearace = UINavigationBar.appearance()
        self.title = "Purchased Articles"


        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
