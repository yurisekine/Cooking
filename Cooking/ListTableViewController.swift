//
//  ListTableViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/29.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

//import Cocoa
import UIKit

class ListTableViewController: UITableViewController {
    
    
//    var foodname: String?
//    var iconimageView: UIImageView?
    
    
    var titleArray: [AnyObject] = []
//    var iconArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if saveData.arrayForKey("TITLE") != nil {
            titleArray = saveData.arrayForKey("TITLE")!
//            iconArray = saveData.arrayForKey("TITLE")!
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //セクションの数を設定
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //セルの個数を指定
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        let nowIndexPathDictionary: (AnyObject) = titleArray[indexPath.row]
        cell.titleLabel.text = nowIndexPathDictionary["title"] as? String
        
        //偶数列の色を変える
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = UIColor.brownColor()
        }
        
        return cell
    }
    
    
    //削除
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath ) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            titleArray.removeAtIndex(indexPath.row)
//            iconArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            saveData.setObject(titleArray, forKey: "TITLE")
//            saveData.setObject(iconArray, forKey: "TITLE")
           
            
        }
    }
}
