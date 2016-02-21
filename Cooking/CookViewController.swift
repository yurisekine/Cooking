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
    @IBOutlet var foodContentsImage: UIImageView!
    var number: Int = 0
    var foodTextArray: [String]!
    var foodImageArray: [UIImage]!

    var foodNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if foodNum == 1 {
            
            foodTextArray = ["じゃがいもは皮をむき、一口大に切って、水にさらして水気を切る","たまねぎは2cm幅のくし切りにする。","にんじんは小さめの一口大の乱切り、しょうがは皮をこそげ落として、薄く輪切りにする。","さやいんげんは筋を取り、熱湯でさっと茹でて引き上げ、長さ3cmに切る。","さやいんげんを茹でた湯で、しらたきを１～２分茹でて水気を切り、ざく切りにする。","豚肉は一口大に切る。","鍋に（Ａ）を豚肉を入れてほぐす。","鍋を強火にかけて煮立て、アクを取り除く。"]
            foodImageArray = [UIImage(named: "1.jpg")!, UIImage(named: "2.jpg")!, UIImage(named: "3.jpg")!, UIImage(named: "4.jpg")!, UIImage(named: "5.jpg")!, UIImage(named: "1.jpg")!, UIImage(named: "2.jpg")!, UIImage(named: "3.jpg")!]
        } else if foodNum == 2 {
            
        } else {
            
        }
        
        foodContentsText.text = foodTextArray[0]
        foodContentsImage.image = foodImageArray[0]
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    @IBAction func plus() {
        if number < foodTextArray.count {
        number = number + 1
        foodContentsText.text = foodTextArray[number]
        foodContentsImage.image = foodImageArray[number]
        }
    }
    
    @IBAction func minus() {
        if number > 0 {
        number = number - 1
            foodContentsText.text = foodTextArray[number]
        foodContentsImage.image = foodImageArray[number]
        }
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
