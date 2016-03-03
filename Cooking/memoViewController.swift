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
        if (saveData.objectForKey("memo")) != nil {
            
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
            TextViewArray = [" ▼+Advice1▼ \n 卵は常温に戻しておこう！　\n ▽メモしよう▽　",
                " ▼+Advice2▼ \n 卵は混ぜ過ぎないでおこう！卵白を切るイメージで！ \n ▽オリジナルでメモしよう▽",
                " ▼+Advice3▼ \n 調味料は均等に混ざるように！ \n ▽オリジナルでメモしよう▽",
                " ▼+Advice4▼ \n 強火で予熱！ \n ▽オリジナルでメモしよう▽",
                " ▼+Advice5▼ \n 流し入れたら火を落として一定に！\n ▽オリジナルでメモしよう▽",
                " ▼+Advice6▼ \n 半熟で巻いても熱で火が通るよ！ \n ▽オリジナルでメモしよう▽",
                " ▼+Advice7▼ \n 全部で2~3回に分けるとうまくいくよ！ \n ▽オリジナルでメモしよう▽",
                " ▼+Advice8▼ \n 弱火で綺麗な見た目にしよう！ \n ▽オリジナルでメモしよう▽",
                " ▼+Advice9▼ \n 調味料は\n　お弁当に入れる場合→砂糖、\n　ふっくらさせたい場合→マヨネーズ\n　などあるので挑戦してみよう！ \n ▽オリジナルでメモしよう▽",
                " ▼+Advice10▼ \n お弁当に入れると可愛い！ \n ▽オリジナルでメモしよう▽"]
            memoTextView.text = TextViewArray[number - 1]
        }
 
        
    }
    
    //画面タップするとキーボード隠れる
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
