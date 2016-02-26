//
//  WebViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/26.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

//import Cocoa

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    var url = "http://www.yahoo.co.jp"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        request()
    }
    
    func request() {
        let requestUrl = NSURL(string: url)
        let request = NSURLRequest(URL: requestUrl!)
        self.webView.loadRequest(request)
    }

}
