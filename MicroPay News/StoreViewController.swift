//
//  StoreViewController.swift
//  MicroPay News
//
//  Created by Julia Duncan on 4/21/15.
//  Copyright (c) 2015 Group 1. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tokenOptions: [String] = ["10 Tokens", "30 Tokens", "50 Tokens", "Monthly Subscription"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        var navigationBarAppearace = UINavigationBar.appearance()
        self.title = "Store"
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        
        return self.tokenOptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.tokenOptions[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        
        println("Row \(indexPath.row) selected.")
        
    }

}
