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

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //ためしに表示
        foodlabel.text = "豚肩ロース薄切り肉100ｇ\nじゃがいも（馬鈴薯） 250ｇ\nたまねぎ 100ｇ\nにんじん 50ｇ\nさやいんげん 20ｇ\nしょうが 5ｇ\nしらたき100ｇ\n（Ａ）水1/2カップ（100ml）\n（Ａ）砂糖大さじ1\n（Ａ）みりん大さじ1\n（Ａ）酒大さじ1\n（Ａ）しょうゆ大さじ2"
        makeLabel.text = "じゃがいもは皮をむき、一口大に切って、水にさらして水気を切る。\nたまねぎは2cm幅のくし切りにする。"
        ingredientImage.image = UIImage(named: "zai.gif")
        
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1200)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func MeatPotato() {
        foodlabel.text = "豚肩ロース薄切り肉100ｇ\nじゃがいも（馬鈴薯） 250ｇ\nたまねぎ 100ｇ\nにんじん 50ｇ\nさやいんげん 20ｇ\nしょうが 5ｇ\nしらたき100ｇ\n（Ａ）水1/2カップ（100ml）\n（Ａ）砂糖大さじ1\n（Ａ）みりん大さじ1\n（Ａ）酒大さじ1\n（Ａ）しょうゆ大さじ2"
        makeLabel.text = "じゃがいもは皮をむき、一口大に切って、水にさらして水気を切る。\n"
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
