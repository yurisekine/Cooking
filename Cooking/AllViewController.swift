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
        
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 800)
        
 
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
        var sake: String!
        var soysauce: String!
        if personNumber < 3 {
            sake = "小さじ \(personNumber)"
            soysauce = "小さじ \(personNumber)/3"
        } else if personNumber == 3 {
            sake = "大さじ 1"
            soysauce = "小さじ 1"
        } else if personNumber == 4 {
            sake = "大さじ 1 と 1/3"
            soysauce = "小さじ 1 と 1/3"
        }
        
        foodlabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        foodlabel.text = "卵 \(personNumber)個 \n だし汁 大さじ\(personNumber) \n 塩 ひとつまみ \n しょうゆ \(soysauce) \n 酒 \(sake) \n 油 大さじ 1"
        foodlabel.numberOfLines = 0
        foodlabel.sizeToFit()
        self.view.addSubview(foodlabel)
        
        makeLabel.text = " 1. たまごを割って、軽く混ぜる \n 2. 調味料をいれて混ぜる \n 3. 油をひいて、強火にかける \n 4. 卵液を箸で落とし数秒で固まる温度になったら\n   　火を少し弱めて、卵液を半分くらい流し込む \n 5. 半熟になったらフライ返しで巻く \n 6. 残りの卵液を流し込む \n 7.最後は弱火にして、卵液を流し込み、形を整える \n 8. 切ってお皿に盛り付けて、完成！！"
        // "玉子はまぜ過ぎない！ \n フライパンなどは、強火で予熱！流し入れたら火を落として一定に！ \n 焦げ防止は、多めに玉子液を流し込む！"
        ingredientImage.image = UIImage(named: "zai.gif")
        makeLabel.numberOfLines = 0
        makeLabel.sizeToFit()
  
    }
    
    func MeatPotato() {
        foodlabel.text = "豚肩ロース薄切り肉100ｇ\nじゃがいも 250ｇ\nたまねぎ 100ｇ\nにんじん 50ｇ\nさやいんげん 20ｇ\nしょうが 5ｇ\nしらたき100ｇ\n (A)水1/2カップ（100ml）\n (A)砂糖大さじ1\n(A)みりん大さじ1\n(A)酒大さじ1\n(A)しょうゆ大さじ2"
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
