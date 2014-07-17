//
//  http.swift
//  wkwebview_example
//
//  Created by James Nocentini on 15/07/2014.
//  Copyright (c) 2014 James Nocentini. All rights reserved.
//

import Foundation

let manager = AFHTTPRequestOperationManager()

func makeRequest() {
    manager.GET(
        "http://api.randomuser.me",
        parameters: nil,
        success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
            println("JSON: " + responseObject.description)
        },
        failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
            println("Error: " + error.localizedDescription)
        }
    )
}
