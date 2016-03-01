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
    
//    var iconimageView: UIImageView?//
    
    
    var titleArray: [AnyObject] = []
    let imageArray: NSArray = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]//iconArray
//    var memoArray:[AnyObject] = []
//    var dateArray:[AnyObject] = []
    var selectedImage: UIImage?
    var selectedName: String?
//    var selectedDate: String?
//    var selectedMemo: String?
    
    
//    var iconArray: [AnyObject] = []//
    let saveData = NSUserDefaults.standardUserDefaults()
//    let iconData = NSUserDefaults.standardUserDefaults()//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if saveData.arrayForKey("TITLE") != nil/* && iconData.arrayForKey("ICON") != nil*/{
            titleArray = saveData.arrayForKey("TITLE")!
//            iconArray = iconData.arrayForKey("ICON")!//
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
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
//        let iconIndexPathDictionary: (AnyObject) = iconArray[indexPath.row]//
        cell.titleLabel.text = nowIndexPathDictionary["title"] as? String
        cell.iconImage.image = UIImage(named:"\(imageArray[indexPath.row])")//
        //
//        cell.iconImage.image = iconIndexPathDictionary["icon"] as? UIImage
        
        //偶数列の色を変える
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = UIColor.brownColor()
        }
        
        return cell
    }
    
    //セルが選択された場合
    override func tableView(table: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let nowIndexPathDictionary: (AnyObject) = titleArray[indexPath.row]
        selectedImage = UIImage(named: "\(imageArray[indexPath.row])")
//        selectedName = titleArray[indexPath.row] as! String
        selectedName = nowIndexPathDictionary["title"] as! String
//        selectedDate = dateArray[indexPath.row] as! String
//        selectedMemo = memoArray[indexPath.row] as! String
        if selectedImage != nil {
            performSegueWithIdentifier("toCellViewController", sender: nil)
        }
 

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCellViewController" {
            let cellV: CellViewController = (segue.destinationViewController as? CellViewController)!
            cellV.selectedImage = selectedImage
            cellV.selectedName = selectedName
//            cellV.selectedDate = selectedDate
//            cellV.selectedMemo = selectedMemo
        }
    }
    
    
    //削除
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath ) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            titleArray.removeAtIndex(indexPath.row)
//            iconArray.removeAtIndex(indexPath.row)//
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            saveData.setObject(titleArray, forKey: "TITLE")
//            iconData.setObject(iconArray, forKey: "ICON")//
           
            
        }
    }
}
