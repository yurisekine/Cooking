//
//  memoViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/26.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class memoViewController: UIViewController {

    //メモ入力用のテキストビュー
    @IBOutlet var memoTextView: UITextView!
    //メモ用の配列を用意
    var TextViewArray: [String] = []
    //配列の番号number(cookから)
    var number: Int!
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //メモが入力された場合
        if((saveData.objectForKey("memo")) != nil) {
            
            //保存内容を格納
            let objects = saveData.objectForKey("memo") as? [String]
            
            var memoString: AnyObject
            
            for memoString in objects! {
                
                TextViewArray.append(memoString as String)
            }
            //配列の中身を表示
            memoTextView.text = TextViewArray[number - 1]
            
        } else {
            //初期値
            TextViewArray = [" ●ワンポイントアドバイス● \n 手洗い大事！　\n ●オリジナルでメモしよう●　","●ワンポイントアドバイス● \n  \n ●オリジナルでメモしよう●","●ワンポイントアドバイス● \n  \n ●オリジナルでメモしよう●","●ワンポイントアドバイス● \n  \n ●オリジナルでメモしよう●","●ワンポイントアドバイス● \n  \n ●オリジナルでメモしよう●","●ワンポイントアドバイス● \n  \n ●オリジナルでメモしよう●","●ワンポイントアドバイス● \n  \n ●オリジナルでメモしよう●","●ワンポイントアドバイス● \n  \n ●オリジナルでメモしよう●","●ワンポイントアドバイス● \n  \n ●オリジナルでメモしよう●"]
            memoTextView.text = TextViewArray[number - 1]
        }
 
        
    }
    
    
    //決定ボタンを押されたとき
    @IBAction func memoDoneButton() {
        //メモを更新
        TextViewArray[number - 1] = memoTextView.text
        saveData.setObject(TextViewArray, forKey: "memo")
        
        //完了のアラート
        let alert = UIAlertController(title: "登録完了", message: "メモを登録しました", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
        
    }
    //Resetボタンを押されたとき
    @IBAction func resetButton() {
        //本当にするのか確認のアラート
        let alert = UIAlertController(title: "警告", message: "本当に削除していいですか？", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .Cancel, handler:nil)
        let removeAction = UIAlertAction(title: "削除", style: .Default) {
            action in
            //削除
            self.saveData.removeObjectForKey("memo")
        }
        
        alert.addAction(cancelAction)
        alert.addAction(removeAction)
        presentViewController(alert, animated: true, completion: nil)


    }
    
}
