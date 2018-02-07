//
//  ViewController.swift
//  PlaceholderTextView
//
//  Created by 张宇 on 2018/2/7.
//  Copyright © 2018年 张宇. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    lazy var placeholderTextView = PlaceholerTextView(placeholder: "please input", placeholderColor: UIColor.lightGray, frame: CGRect(x: 40, y: 100, width: 320, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeholderTextView.isShowCountLabel = true
        placeholderTextView.limitWords = 1000
        view.addSubview(placeholderTextView)
        
    }

}

