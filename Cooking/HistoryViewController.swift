//
//  HistoryViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/28.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var foodname: String?
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let registerViewController = segue.destinationViewController as! RegisterViewController
        registerViewController.foodname = self.foodname
    }
    

}
