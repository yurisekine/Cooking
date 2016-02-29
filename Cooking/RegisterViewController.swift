//
//  RegisterViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/28.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
   // @IBOutlet var titleTextField: UITextField!
    var foodname: String?
    
    var titleArray: [AnyObject] = []
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
        //ViewControllerで選択された料理名をテキストフィールドに元から表示
        nameTextField.text = foodname
        
        if saveData.arrayForKey("TITLE") != nil {
            titleArray = saveData.arrayForKey("TITLE")!
        }
    }
    
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
    
    @IBAction func save() {
        let titleDictionary = ["title": nameTextField.text!] //!なしだとString?型、!をつけてString型に
        
        if nameTextField.text == "" {
            let alert = UIAlertController(
                title: "保存失敗",
                message: "テキスト入力欄に入力してください",
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
            
            titleArray.append(titleDictionary)
            saveData.setObject(titleArray, forKey: "TITLE")
            
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
            nameTextField.text = ""
        }
    }
    
    
    //登録ボタンを押した時に呼ばれるメソッド
  /*  @IBAction func registerButton(sender: UIButton) {
    
    let date = datePicker.date
    //配列に保存するように書き換えるココ
    label1.text = NSDateFormatter.localizedStringFromDate(date, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
    
    
        guard let selectedPhoto = photoImageView.image else {
            simpleAlert("画像がありません")
            return
        }
    
        
        let alertController = UIAlertController(title: "アップロード先を選択", message: nil, preferredStyle: .ActionSheet)
    
        let thirdAction = UIAlertAction(title: "カメラロールに保存", style: .Default) {
            action in
            UIImageWriteToSavedPhotosAlbum(selectedPhoto, self, nil, nil)
            self.simpleAlert("アルバムに保存されました。")
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
    
        alertController.addAction(thirdAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    */
    

    

}
