# WWAutolayoutConstraint
[![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-15.0](https://img.shields.io/badge/iOS-15.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![TAG](https://img.shields.io/github/v/tag/William-Weng/WWAutolayoutConstraint) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Simple use of NSLayoutConstraint.](https://developer.apple.com/documentation/uikit/nslayoutconstraint)
- [簡單的使用NSLayoutConstraint。](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/從程式利用-nslayoutanchor-設定-auto-layout-條件的各種寫法-2797d8e09a82)

https://github.com/user-attachments/assets/7f0c83b8-1c3c-4bc9-b6d4-3d1bf543bd51

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWAutolayoutConstraint.git", .upToNextMajor(from: "0.7.0"))
]
```

### 可用函式 (Function)
|函式|功能|
|-|-|
|cover(on:)|完全蓋在上面|
|center(on:top:leading:)|畫面置中|
|top(by:yAxis:useSafeArea:)|跟上下方的間距|
|bottom(by:yAxis:useSafeArea:)|跟上下方的間距|
|leading(by:xAxis:useSafeArea:)|跟左右邊的間距|
|trailing(by:xAxis:useSafeArea:)|跟左右邊的間距|
|height(\_:)|高度|
|width(\_:)|寬度|
|height(by:ratio:offset:)|高度比例|
|width(by:ratio:offset:)|寬度比例|
|aspect(ratio:offset:)|自身長寬比|
|centerX(by:multiplier:offset:)|垂直置中|
|centerY(by:multiplier:offset:)|水平置中|
|updateTop(\_:)|更新上下約束|
|updateBottom(\_:)|更新上下約束|
|updateLeading(\_:)|更新左右約束|
|updateTrailing(\_:)|更新左右約束|
|updateWidth(\_:)|更新寬度約束|
|updateHeight(\_:)|更新高度約束|
|finish()|完成結束|

### Example
```swift
final class ViewController: UIViewController {
    
    private lazy var centerView = {
        
        let centerView = UIView()
        centerView.backgroundColor = .yellow
        view.addSubview(centerView)
        
        return centerView
    }()
    
    @IBAction func updatCenterAction(_ sender: UIBarButtonItem) {
        
        centerView.autolayout
            .updateWidth(200)
            .updateHeight(400)
            .updateCenterY(100)
            .finish()
        
        UIView.animate(withDuration: 1.0) { self.view.layoutIfNeeded() }
    }
    
    @IBAction func centerAction(_ sender: UIBarButtonItem) {
        
        centerView.autolayout
            .centerX(by: view)
            .centerY(by: view, multiplier: 1.0)
            .width(50)
            .height(100)
            .finish()
    }
}
```
