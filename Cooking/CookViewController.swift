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

    override func viewDidLoad() {
        super.viewDidLoad()

        foodContentsText.text = "では、さっそく料理を始めましょう！"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
