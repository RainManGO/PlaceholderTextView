# PlaceholderTextView

介绍
==============
简单的textView封装，支持一些常用的功能



功能支持
==============
- **Placeholder占位字**: 没有内容的时候显示的文字
- **字数统计**:显示输出字的个数 。
- **字数限制**: 输入到限制字数不让输入。
- **支持xib**: xib storyBoard 创建直接对应类即可。


代码使用方法
==============
```objc
      // 初始化placeholderTextView
       lazy var placeholderTextView = PlaceholerTextView(placeholder: "please input", placeholderColor: UIColor.lightGray, frame: CGRect(x: 40, y: 100, width: 320, height: 200))
    
        //设置是否显示计算label
        placeholderTextView.isShowCountLabel = true
        //限制字数
        placeholderTextView.limitWords = 1000
```

XIB代码使用方法
==============
![image](https://github.com/RainManGO/PlaceholderTextView/blob/master/xibUsage.png)



演示
==============
![image](https://github.com/RainManGO/PlaceholderTextView/blob/master/demo.gif)


