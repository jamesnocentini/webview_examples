//
//  navigation.swift
//  wkwebview_example
//
//  Created by James Nocentini on 16/07/2014.
//  Copyright (c) 2014 James Nocentini. All rights reserved.
//

import Foundation
import UIKit

var charts = [
    [
        "title": "Bar Chart",
        "dir": "barchart"
    ],
    [
        "title": "Squares Rotating",
        "dir": "squares"
    ]
]

class TableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    convenience init() {
        self.init(style: UITableViewStyle.Plain)
        self.navigationItem.title = "Choose one"
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return charts.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = UITableViewCell()
        var item : Dictionary = charts[indexPath.row]
        
        cell.textLabel.text = item["title"]
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        var wvc = WKViewController(webFile: charts[indexPath.row]["dir"]!)
        self.navigationController.pushViewController(wvc, animated: true)
        
    }
    
}