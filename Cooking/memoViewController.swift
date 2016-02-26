//
//  memoViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/26.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

//import Cocoa
import UIKit

class memoViewController: UIViewController {

    //メモ入力用のテキストビュー
    @IBOutlet var memoTextView: UITextView!
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = "好きなようにメモしよう！"
        memoTextView.text = saveData.objectForKey("memo") as! String!
        
    }
    
    
    @IBAction func memoDoneButton() {
        saveData.setObject(memoTextView.text, forKey: "memo")
        
        let alert = UIAlertController(title: "登録完了", message: "メモを登録しました", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
}
