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
    
    
    var titleArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        if saveData.arrayForKey("TITLE") != nil {
            titleArray = saveData.arrayForKey("TITLE")!
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
    
    //セルの個数を指定します
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        
        let nowIndexPathDictionary: (AnyObject) = titleArray[indexPath.row]
        
        cell.titleLabel.text = nowIndexPathDictionary["title"] as? String
        
        return cell
    }


}
