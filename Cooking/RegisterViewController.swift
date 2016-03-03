//
//  RegisterViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/28.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UITextViewDelegate{
    
    var nameArray: [AnyObject] = []
    var imageArray: [AnyObject] = []
    var memoArray: [AnyObject] = []
    var dateArray: [AnyObject] = []
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    
    //題名入力用TextField
    @IBOutlet var nameTextField: UITextField!
    //写真表示用ImageView
    @IBOutlet weak var photoImageView: UIImageView!
    //メモ用TextView
    @IBOutlet var memoView: UITextView!
    //DatePicker
    @IBOutlet var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        memoView.delegate = self
        
        
        nameTextField.text = "料理名"
        
        if saveData.arrayForKey("NAME") != nil {
            nameArray = saveData.arrayForKey("NAME")!
        }
        if saveData.arrayForKey("IMAGE") != nil {
            imageArray = saveData.arrayForKey("IMAGE")!
        }
        if saveData.arrayForKey("DATE") != nil {
            dateArray = saveData.arrayForKey("DATE")!
        }
        if saveData.arrayForKey("MEMO") != nil {
            memoArray = saveData.arrayForKey("MEMO")!
        }

    }
    
    //テキストフィールド入力時returnキーを押すとキーボードが隠れる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //画面タップするとキーボード隠れる
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
   /* func textViewShouldEndEditing(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }意味なかった*/
    
    //カメラ、アルバムの呼び出しメソッド(カメラorアルバムのソースタイプが引数)
    func precentPickerController(sourceType: UIImagePickerControllerSourceType) {
        
        //ライブラリが使用できるかどうか判定
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            //UIImagePickerControllerをインスタンス化
            let picker = UIImagePickerController()
            
            //ソースタイプを設定
            picker.sourceType = sourceType
            
            //デリケートを設定
            picker.delegate = self
            
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    
    //写真が選択された時に呼び出されるメソッド
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: NSDictionary!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //画像を出力
        photoImageView.image = image
    }
    
    
    //画像を取得するボタンを押した時に呼ばれるメソッド
    @IBAction func selectButton(sender: UIButton) {
        
        //選択肢の上に表示するタイトル、メッセージ、アラートタイプの設定
        let alertController = UIAlertController(title: "画像の取得先を選択", message: nil, preferredStyle: .ActionSheet)
        
        //選択肢の名前と処理を１つずつ設定
        let firstAction = UIAlertAction(title: "カメラ", style:  .Default) {
            action in
            self.precentPickerController(.Camera)
        }
        let secondAction = UIAlertAction(title: "アルバム", style:  .Default) {
            action in
            
            self.precentPickerController(.PhotoLibrary)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        
        //設定した選択肢をアラートに登録
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(cancelAction)
        
        //アラートを表示
        presentViewController(alertController, animated: true, completion: nil)
    }
    
  
    
    //datepickerをStringに
    func format(date : NSDate, style : String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = style
        return  dateFormatter.stringFromDate(date)
    }

    
    @IBAction func save() {
        
        let name = ["name": nameTextField.text!] //!なしだとString?型、!をつけてString型に
//        let image = ["image": photoImageView.image!]いらなそう
//        let date = ["date": format(datePicker.date, style: "yyyy/MM/dd")]
        let memo = ["memo": memoView.text!]
        
        
       
        if nameTextField.text == "" || photoImageView.image == nil /*|| memoView.text == "" */{
            let alert = UIAlertController(
                title: "保存失敗",
                message: "料理名、または画像が未入力です",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: nil
                )
            )
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            
            nameArray.append(name)
            memoArray.append(memo)
            let date = format(datePicker.date, style: "yyyy/MM/dd")
            dateArray.append(date)
            
            if let data: NSData = UIImagePNGRepresentation(photoImageView.image!) {
                imageArray.append(data)
            }

            saveData.setObject(nameArray, forKey: "NAME")
            saveData.setObject(imageArray, forKey: "IMAGE")
            saveData.setObject(memoArray, forKey: "MEMO")
            saveData.setObject(dateArray, forKey: "DATE")
            
            let alert = UIAlertController(
                title: "保存完了",
                message: "登録が完了しました",
                preferredStyle:  UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: nil
                )
            )
            self.presentViewController(alert, animated: true, completion: nil)
            nameTextField.text = "料理名"
            photoImageView.image = nil
            memoView.text = "メモ"
            
        
        }
    }


}
