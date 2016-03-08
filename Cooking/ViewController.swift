//
//  ViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/02/18.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var menuPickerView: UIPickerView!
    var menuImageArray: [UIImage]!
//    var selectedLabel: UILabel!
    
    let menuArray = [
        "玉子焼き",
        "肉じゃが",
        "オムライス"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuPickerView.delegate = self
        menuPickerView.dataSource = self
        
        //初期選択させる
//        self.selectedLabel = menuPickerView.viewForRow(0, forComponent: 0) as! UILabel
        
        menuImageArray = [
                UIImage(named: "egg9.jpg")!,
                UIImage(named: "meatpotato.gif")!,
                UIImage(named: "omu.gif")!
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back (segue: UIStoryboardSegue) {
        
    }
    
    //picker view
    //列の数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //行の数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return menuArray.count
    }
    
    
    //menuの表示
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return menuArray[row]
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let row = menuPickerView.selectedRowInComponent(0)
        
        if segue.identifier == "food" {
            let foodViewController = segue.destinationViewController as! FoodViewController
            foodViewController.nameText = menuArray[row] //料理名
            foodViewController.foodimage = menuImageArray[row] //料理名
            foodViewController.number = row //menuPickerViewの番号
        } else {
            
        }
    }

            /*   } else if segue.identifier == "history" {
            let listTableViewController = segue.destinationViewController as! ListTableViewController
            listTableViewController.foodname = menuArray[row]
            }*/
}
