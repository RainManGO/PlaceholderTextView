//
//  PlaceholderTextView.swift
//  PlaceholderTextView
//
//  Created by Nvr on 2018/10/19.
//  Copyright © 2018年 张宇. All rights reserved.
//

import UIKit

//plaleLabel 的位置
struct PlaceholderLabelOrigin {
    let x = 15.5
    let y = 11.8
}

//内边距，可根据个人手动调整
struct TextContainerInset{
    let top:CGFloat = 12.0
    let left:CGFloat = 12.0
    let bottom:CGFloat = 0.0
    let right:CGFloat = 12.0
}

class PlaceholderTextView: UIView {

    //MARK: - 懒加载属性
    lazy var plaleLabel = UILabel()
    lazy var countLabel = UILabel()
    lazy var palceholdertextView = UITextView()

    //储存属性
    @objc var placeholderGlobal:String?{      //提示文字
        didSet{
            plaleLabel.text = placeholderGlobal
            plaleLabel.sizeToFit()
        }
    }
    @objc var placeholderColorGlobal:UIColor?{
        didSet{
            plaleLabel.textColor = placeholderColorGlobal
        }
    }
    @objc var isReturnHidden:Bool = false     //是否点击返回失去响应
    @objc var isShowCountLabel:Bool = false { //是否显示计算个数的Label
        didSet{
            countLabel.isHidden = !isShowCountLabel
        }
    }
    @objc var limitWords:UInt = 1000             //限制输入个数   默认为999999，不限制输入
    
    //MARK: - 系统方法
    /// PlaceholerTextView 唯一初始化方法
    convenience init(placeholder:String?,placeholderColor:UIColor?,frame: CGRect) {
        self.init(frame: frame)
        setup(placeholder: placeholder, placeholderColor: placeholderColor)
        placeholderGlobal = placeholder
        placeholderColorGlobal = placeholderColor
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //XIB 调用
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(placeholder: nil, placeholderColor: nil)
    }
    
}

//MARK: - 自定义UI
extension PlaceholderTextView{
    
    /// placeholder Label Setup
    private func setup(placeholder:String?,placeholderColor:UIColor?){
        palceholdertextView.delegate = self
        palceholdertextView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 30)
        self.addSubview(palceholdertextView)
        if palceholdertextView.font==nil {
            palceholdertextView.font = UIFont.systemFont(ofSize: 14)
        }
        
        plaleLabel.textColor = placeholderColor
        plaleLabel.textAlignment = .left
        plaleLabel.font = palceholdertextView.font
        plaleLabel.text = placeholder
        plaleLabel.sizeToFit()
        addSubview(plaleLabel)
        plaleLabel.frame.origin = CGPoint(x: PlaceholderLabelOrigin().x, y: PlaceholderLabelOrigin().y)
        palceholdertextView.textContainerInset = UIEdgeInsetsMake(TextContainerInset().top, TextContainerInset().left, TextContainerInset().bottom, TextContainerInset().right)
        print(plaleLabel)
        countLabel.font = palceholdertextView.font
        addSubview(countLabel)
    }
    
}

//MARK: - UITextViewDelegate代理方法
extension PlaceholderTextView : UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        checkShowHiddenPlaceholder()
        countLabel.text = "\(textView.text.count)/\(limitWords)"
        countLabel.sizeToFit()
        countLabel.frame.origin = CGPoint(x: frame.width-countLabel.frame.width-10, y: frame.height-countLabel.frame.height-5)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text=="\n"&&isReturnHidden==true {
            textView.resignFirstResponder()
        }
        
        //大于等于限制字数，而且不是删除键的时候不可以输入。
        if range.location+range.length >= limitWords && !(text as NSString).isEqual(to: ""){
            return false
        }
        
        return true
    }
    
    
}


//MARK : - 工具方法

extension PlaceholderTextView {
    
    ///根据textView是否有内容显示placeholder
    private func checkShowHiddenPlaceholder(){
        if self.palceholdertextView.hasText {
            plaleLabel.text = nil
            countLabel.isHidden = false
        }else{
            plaleLabel.text = placeholderGlobal
            countLabel.isHidden = true
        }
    }
    
}
