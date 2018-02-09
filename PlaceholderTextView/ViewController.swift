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

    // 初始化placeholderTextView
    lazy var placeholderTextView = PlaceholerTextView(placeholder: "please input", placeholderColor: UIColor.lightGray, frame: CGRect(x: 40, y: 100, width: 320, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置是否显示计算label
        placeholderTextView.isShowCountLabel = true
        //限制字数
        placeholderTextView.limitWords = 1000
        //是否return关闭键盘
        placeholderTextView.isReturnHidden = true
        
        view.addSubview(placeholderTextView)
        
    }

}

