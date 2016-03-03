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
    
//    var iconimageView: UIImageView?
    
    var nameArray: [AnyObject] = []
    var imageArray: [AnyObject] = []
    var memoArray:[AnyObject] = []
    var dateArray:[AnyObject] = []
    
    var selectedImage: UIImage?
    var selectedName: String?
    var selectedDate: String?
    var selectedMemo: String?
    
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //キー
        if saveData.arrayForKey("NAME") != nil {
            nameArray = saveData.arrayForKey("NAME")!
        }
        if saveData.arrayForKey("IMAGE") != nil {
            imageArray = saveData.arrayForKey("IMAGE")!
        }
        if saveData.arrayForKey("DATE") != nil {
             dateArray = saveData.arrayForKey("DATE")!
            print("dateArray...1回目\(dateArray)")
        }
        if saveData.arrayForKey("MEMO") != nil {
            memoArray = saveData.arrayForKey("MEMO")!
            print("memoArray...\(memoArray)")
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
        return nameArray.count
    }
    
    //セルの設定
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        let nowIndexPathDictionary: (AnyObject) = nameArray[indexPath.row]
        cell.nameLabel.text = nowIndexPathDictionary["name"] as? String
        
        let nsData = imageArray[indexPath.row] //var
        let image = UIImage(data: nsData as! NSData)
        cell.iconImage.image = image
        
//        cell.iconImage.image = UIImage(named:"\(imageArray[indexPath.row])")//
        
        cell.nameLabel.textColor = UIColor.brownColor()
        
        //偶数列の色を変える
        if indexPath.row % 2 == 1 {
            cell.nameLabel.textColor = UIColor.whiteColor()
            cell.backgroundColor = UIColor.brownColor()
        }
        
        return cell
    }
    
    //セルが選択された場合
    override func tableView(table: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let nowIndexPathDictionary: (AnyObject) = nameArray[indexPath.row]
        selectedName = nowIndexPathDictionary["name"] as? String
        
        let nsData = imageArray[indexPath.row] //var
        selectedImage = UIImage(data: nsData as! NSData)

        selectedDate = dateArray[indexPath.row] as? String
        print("押した時dateArrayは...\(dateArray)")
        
//        selectedMemo = memonowIndexPathDictionary["memo"] as? String
//        selectedMemo = memoArray[indexPath.row] as? String
        let memonowIndexPathDictionary: (AnyObject) = memoArray[indexPath.row]
        selectedMemo = memonowIndexPathDictionary["memo"] as? String
        
        if selectedImage != nil {
            performSegueWithIdentifier("toCellViewController", sender: nil)
        } else {
        print("画像なし")
    }
        if selectedDate == "" {
            print("日付なし")
        }
 
        if selectedMemo == "" {
            print("メモなし")
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCellViewController" {
            let cellV: CellViewController = (segue.destinationViewController as? CellViewController)!
            cellV.selectedImage = selectedImage
            cellV.selectedName = selectedName
            cellV.selectedDate = selectedDate
            cellV.selectedMemo = selectedMemo
        }
    }
    
    
    //削除
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath ) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            //本当にするのか確認のアラート
            let alert = UIAlertController(title: "警告", message: "本当に削除していいですか？", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "cancel", style: .Cancel, handler:nil)
            let removeAction = UIAlertAction(title: "削除", style: .Default) {
                action in
                //削除
                self.nameArray.removeAtIndex(indexPath.row)
                self.imageArray.removeAtIndex(indexPath.row)
                self.dateArray.removeAtIndex(indexPath.row)
                self.memoArray.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                self.saveData.setObject(self.nameArray, forKey: "NAME")
                self.saveData.setObject(self.imageArray, forKey: "IMAGE")
                self.saveData.setObject(self.dateArray, forKey: "DATE")
                self.saveData.setObject(self.memoArray, forKey: "MEMO")
                
            }
            
            alert.addAction(cancelAction)
            alert.addAction(removeAction)
            presentViewController(alert, animated: true, completion: nil)
            
            
            
     /*       nameArray.removeAtIndex(indexPath.row)
            imageArray.removeAtIndex(indexPath.row)
            */
            
//            memoArray.removeAtIndex(indexPath.row)
            
        /*    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            saveData.setObject(nameArray, forKey: "NAME")
            saveData.setObject(imageArray, forKey: "IMAGE")
          */
            
            
//            saveData.setObject(memoArray, forKey: "MEMO")
//            saveData.setObject(iconArray, forKey: "ICON")//
           
            
        }
    }
}
