//
//  AllViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/18.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class AllViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!    
    @IBOutlet var foodlabel: UILabel!
    @IBOutlet var ingredientImage: UIImageView!
    @IBOutlet var makeLabel: UILabel!

    var number: Int?
    
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
            foodlabel.text = "\(number)"
        }
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func Egg() {
        foodlabel.text = "卵３個 \n だし汁大さじ３ \n 塩ひとつまみ \n しょうゆ小さじ１ \n 酒大さじ１ \n 油大さじ１"
        makeLabel.text = "玉子はまぜ過ぎない！ \n フライパンなどは、強火で予熱！流し入れたら火を落として一定に！ \n 焦げ防止は、多めに玉子液を流し込む！"
        ingredientImage.image = UIImage(named: "zai.gif")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
