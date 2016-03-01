//
//  CellViewController.swift
//  Cooking
//
//  Created by SEKINE YURI on 2016/03/01.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import Foundation

import UIKit

class CellViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var memoLabel: UILabel!
    
    var selectedName: String!
    var selectedImage: UIImage!
    var selectedDate: String!
    var selectedMemo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedName
        imageView.image = selectedImage
//        dateLabel.text = selectedDate
//        memoLabel.text = selectedMemo
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}