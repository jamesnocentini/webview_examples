//
//  contollers.swift
//  wkwebview_example
//
//  Created by James Nocentini on 11/07/2014.
//  Copyright (c) 2014 James Nocentini. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WKViewController: UIViewController {
    
    var webfile: NSString?
    
    convenience init(webFile file: NSString) {
        self.init()
        self.webfile = file
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.loadWKWebView(self.webfile!)
        self.loadUIWebView(self.webfile!)
        
    }
    
    
    func loadUIWebView(webfile: NSString) {
        var path = NSBundle.mainBundle().pathForResource(webfile, ofType: "html")
        var url = NSURL(fileURLWithPath: path)
        var request = NSURLRequest(URL: url)
        
        var topScreen = CGRectMake(0, 44, self.view.bounds.width, self.view.bounds.height / 2 - 22)
        
        var uiwebview = UIWebView(frame: topScreen)
        uiwebview.loadRequest(request)
        
        self.view.addSubview(uiwebview)
    }
    
    func loadWKWebView(webfile: NSString) {
        var path = NSBundle.mainBundle().pathForResource(webfile, ofType: "html")
        var url = NSURL(fileURLWithPath: path)
        var request = NSURLRequest(URL: url)
        
        var halfScreen = CGRectMake(0, self.view.bounds.height / 2, self.view.bounds.width, self.view.bounds.height / 2 - 22)
        
        var wkwebview: WKWebView = WKWebView(frame: halfScreen)
        wkwebview.loadRequest(request)
        
        self.view.addSubview(wkwebview)
    }
    
}