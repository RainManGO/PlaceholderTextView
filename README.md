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


使用方法
==============

```objc
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
```
