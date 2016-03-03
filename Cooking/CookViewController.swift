//
//  CookViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/21.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class CookViewController: UIViewController {
    
    @IBOutlet var foodContentsText: UILabel!
    @IBOutlet var itemText: UILabel!
    @IBOutlet var processText: UILabel!
    @IBOutlet var foodContentsImage: UIImageView!
    @IBOutlet var processBar: UIProgressView!

    var number: Float = 1
    var foodTextArray: [String]!
    var foodImageArray: [UIImage]!
    var itemTextArray: [String]!

    var foodnumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        if foodnumber == 0 {
            Egg()
        } else if foodnumber == 1 {
            MeatPotato()
        } else if foodnumber == 2 {
            hamburg()
        } else if foodnumber == 3{
            omuRice()
        } else {
            //foodlabel.text = "\(number)"
        }

        foodContentsText.text = foodTextArray[0]
        foodContentsImage.image = foodImageArray[0]
        itemText.text = itemTextArray[0]
        
        
        processBar.transform = CGAffineTransformMakeScale(2.0, 3.0)
        processBar.progress = number / Float(foodTextArray.count)
        processText.text = "\(Int(number)) / \(foodTextArray.count)"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func Egg() {
        foodTextArray = [
            "材料、用意するものは揃っているかな？",
            "たまごを割って、軽く混ぜる",
            "調味料をいれて混ぜる",
            "油をひいて、強火にかける",
            "卵液を箸で落としてみて、数秒で固まる温度になったら、 \n 火を少し弱めて、卵液を半分くらい流し込む",
            "半熟になったらフライ返しで巻く",
            "残りの卵液を流し込む",
            "最後は弱火にして、卵液を流し込み、 \n　形を整える",
            "切ってお皿に盛り付けて、完成！！",
            "ななめに切り込みを入れるとハートにもできるよ！"
        ]
        itemTextArray = [
            "手を洗って準備しよう！",
            "たまご、ボウル、はし",
            "醤油、塩、だし、酒",
            "油、フライパン",
            "卵液",
            "フライ返し",
            "卵液",
            "",
            "お皿、ナイフ",
            "ナイフ"
        ]
        foodImageArray = [
            UIImage(named: "ingre.gif")!,
            UIImage(named: "egg2.jpg")!,
            UIImage(named: "egg3.jpg")!,
            UIImage(named: "egg4.jpg")!,
            UIImage(named: "egg5-2.jpg")!,
            UIImage(named: "egg6.jpg")!,
            UIImage(named: "egg7.jpg")!,
            UIImage(named: "egg8.jpg")!,
            UIImage(named: "egg9.jpg")!,
            UIImage(named: "egg10.jpg")!
        ]
        
    }
    
    
    func MeatPotato() {
        
        foodTextArray = ["じゃがいもは皮をむき、一口大に切って、水にさらして水気を切る",
            "たまねぎは2cm幅のくし切りにする。",
            "にんじんは小さめの一口大の乱切り、しょうがは皮をこそげ落として、薄く輪切りにする。",
            "さやいんげんは筋を取り、熱湯でさっと茹でて引き上げ、長さ3cmに切る。",
            "さやいんげんを茹でた湯で、しらたきを１～２分茹でて水気を切り、ざく切りにする。",
            "豚肉は一口大に切る。",
            "鍋に（Ａ）を豚肉を入れてほぐす。",
            "鍋を強火にかけて煮立て、アクを取り除く。"
        ]
        foodImageArray = [UIImage(named: "1.jpg")!,
            UIImage(named: "2.jpg")!,
            UIImage(named: "3.jpg")!,
            UIImage(named: "4.jpg")!,
            UIImage(named: "5.jpg")!,
            UIImage(named: "1.jpg")!,
            UIImage(named: "2.jpg")!,
            UIImage(named: "3.jpg")!,
            UIImage(named: "4.jpg")!
        ]
        itemTextArray = []
        
    }
    func hamburg() {
        foodTextArray = ["",""]
        foodImageArray = [UIImage(named: "1.jpg")!, UIImage(named: "2.jpg")!]
        itemTextArray = []
    }
    func omuRice() {
        foodTextArray = ["",""]
        foodImageArray = [UIImage(named: "1.jpg")!, UIImage(named: "2.jpg")!]
        itemTextArray = []
    }
    
    @IBAction func plus() {
        if number < Float(foodTextArray.count - 1) { //7
            number = number + 1
            foodContentsText.text = foodTextArray[Int(number - 1)]
            foodContentsImage.image = foodImageArray[Int(number - 1)]
            itemText.text = itemTextArray[Int(number - 1)]
            processBar.setProgress(number / Float(foodTextArray.count) , animated: true)
            processText.text = "\(Int(number)) / \(foodTextArray.count)"
        }else if number == Float(foodTextArray.count - 1) {
            number = number + 1
            foodContentsText.text = foodTextArray[Int(number - 1)]
            foodContentsImage.image = foodImageArray[Int(number - 1)]
            itemText.text = itemTextArray[Int(number - 1)]
            processBar.setProgress(number / Float(foodTextArray.count) , animated: true)
            processText.text = "\(Int(number)) / \(foodTextArray.count)"
        }
    }
    
    @IBAction func minus() {
        if number > 1 {
            number = number - 1
            foodContentsText.text = foodTextArray[Int(number - 1)]
            foodContentsImage.image = foodImageArray[Int(number - 1)]
            itemText.text = itemTextArray[Int(number - 1)]
            processBar.setProgress(number / Float(foodTextArray.count) , animated: true)
            processText.text = "\(Int(number)) / \(foodTextArray.count)"
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cookmemoViewController = segue.destinationViewController as! memoViewController
       // let row = PickerView.selectedRowInComponent(0)
        let row = self.number
        cookmemoViewController.number = Int(row)  //menuPickerViewの番号
    }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
