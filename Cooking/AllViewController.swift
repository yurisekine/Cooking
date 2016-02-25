//
//  AllViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/18.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class AllViewController: UIViewController, UIActionSheetDelegate {
    
    @IBOutlet var scrollView: UIScrollView!    
    @IBOutlet var foodlabel: UILabel!
    @IBOutlet var ingredientImage: UIImageView!
    @IBOutlet var makeLabel: UILabel!
    @IBOutlet var personLabel: UILabel!

    var number: Int?
    var personNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1200)
        
 
        if number == 0 {
            Egg()
        } else if number == 1 {
            MeatPotato()
        } else if number == 2 {
            hamburg()
        } else if number == 3{
            omuRice()
        } else {
        //    foodlabel.text = "\(number)"
        }
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func Egg() {
        
        foodlabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        foodlabel.text = "卵\(personNumber)個 \n だし汁大さじ\(personNumber) \n 塩ひとつまみ \n しょうゆ小さじ\(personNumber) \n 酒大さじ\(personNumber) \n 油大さじ１" //卵\3個 \n だし汁大さじ３ \n 塩ひとつまみ \n しょうゆ小さじ１ \n 酒大さじ１ \n 油大さじ１"

        foodlabel.numberOfLines = 0
        foodlabel.sizeToFit()
        self.view.addSubview(foodlabel)
        
        makeLabel.text = "玉子はまぜ過ぎない！ \n フライパンなどは、強火で予熱！流し入れたら火を落として一定に！ \n 焦げ防止は、多めに玉子液を流し込む！"
        ingredientImage.image = UIImage(named: "zai.gif")
        makeLabel.numberOfLines = 0
        makeLabel.sizeToFit()
  
    }
    
    func MeatPotato() {
        foodlabel.text = "豚肩ロース薄切り肉100ｇ\nじゃがいも（馬鈴薯） 250ｇ\nたまねぎ 100ｇ\nにんじん 50ｇ\nさやいんげん 20ｇ\nしょうが 5ｇ\nしらたき100ｇ\n（Ａ）水1/2カップ（100ml）\n（Ａ）砂糖大さじ1\n（Ａ）みりん大さじ1\n（Ａ）酒大さじ1\n（Ａ）しょうゆ大さじ2"
        makeLabel.text = "じゃがいもは皮をむき、一口大に切って、水にさらして水気を切る。\nたまねぎは2cm幅のくし切りにする。"
        ingredientImage.image = UIImage(named: "zai.gif")
    }
    
    func hamburg() {
        foodlabel.text = "はん"
        makeLabel.text = ""
        ingredientImage.image = UIImage(named: "zai.gif")
    }
    
    func omuRice() {
        foodlabel.text = "おむ"
        makeLabel.text = ""
        ingredientImage.image = UIImage(named: "zai.gif")
    }
    
    
    @IBAction func ButtonTapped(sender: UIButton) {
        self.personPicker(sender)
    }
    
    func personPicker(sender: UIButton) {
        let person: [AnyObject] = ["1人分","2人分","3人分","4人分"]
        let actionSheet = ActionSheetStringPicker(title: "choice person", rows: person, initialSelection: 0, doneBlock: {(picker, selectedIndex, id) -> Void in print("picker...\(picker), selectedIndex...\(selectedIndex), id...\(id)")
            
            self.personNumber = selectedIndex + 1
            self.personLabel.text = person[selectedIndex] as! String
            self.Egg()
            
            }, cancelBlock: { (picker) -> Void in
                print("\(picker)")
            }, origin: sender)
        
        
        
        
        actionSheet.showActionSheetPicker()
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
