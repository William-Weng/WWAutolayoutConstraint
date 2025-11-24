//
//  Extension.swift
//  WWAutolayoutConstraint
//
//  Created by William.Weng on 2025/11/4.
//

import UIKit

// MARK: - UIView
extension UIView {
    
    /// [設定LayoutConstraint => 不能加frame](https://zonble.gitbooks.io/kkbox-ios-dev/content/autolayout/intrinsic_content_size.html)
    /// - Parameter superView: [此View的SuperView](https://www.appcoda.com.tw/auto-layout-programmatically/)
    func _autolayout(on superView: UIView) {

        removeFromSuperview()
        superView.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
        ])
    }
    
    /// 自動置中對齊 (UIIamgeView)
    /// - Parameters:
    ///   - view: 此View的SuperView
    ///   - top: 向上的間隔數值
    ///   - left: 向左的間隔數值
    func _autolayout(centerOn superView: UIView, top: CGFloat?, left: CGFloat?) {

        removeFromSuperview()
        superView.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [
            centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            centerYAnchor.constraint(equalTo: superView.centerYAnchor),
        ]
        
        if let top = top { constraints.append(topAnchor.constraint(equalTo: superView.topAnchor, constant: top)) }
        if let left = left { constraints.append(leftAnchor.constraint(equalTo: superView.leftAnchor, constant: left)) }

        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - UIView
extension UIView {
    
    /// 跟上下方的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - yAxis: 對齊的位置
    func _top(by otherView: UIView, yAxis: WWAutolayoutWrapper<UIView>.YAxisType) {
        
        let constraints: [NSLayoutConstraint]
        
        switch yAxis {
        case .top(let offset): constraints = [topAnchor.constraint(equalTo: otherView.topAnchor, constant: offset)]
        case .bottom(let offset): constraints = [topAnchor.constraint(equalTo: otherView.bottomAnchor, constant: offset)]
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 跟上下方的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - yAxis: 對齊的位置
    func _bottom(by otherView: UIView, yAxis: WWAutolayoutWrapper<UIView>.YAxisType) {
        
        let constraints: [NSLayoutConstraint]
        
        switch yAxis {
        case .top(let offset): constraints = [bottomAnchor.constraint(equalTo: otherView.topAnchor, constant: offset)]
        case .bottom(let offset): constraints = [bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: offset)]
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 跟左右邊的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - xAxis: 對齊的位置
    func _left(by otherView: UIView, xAxis: WWAutolayoutWrapper<UIView>.XAxisType) {
        
        let constraints: [NSLayoutConstraint]
        
        switch xAxis {
        case .left(let offset): constraints = [leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: offset)]
        case .right(let offset): constraints = [leadingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: offset)]
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 跟左右邊的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - xAxis: 對齊的位置
    func _right(by otherView: UIView, xAxis: WWAutolayoutWrapper<UIView>.XAxisType) {
        
        let constraints: [NSLayoutConstraint]
        
        switch xAxis {
        case .left(let offset): constraints = [trailingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: offset)]
        case .right(let offset): constraints = [trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: offset)]
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 高度
    /// - Parameter height: CGFloat
    func _height(with height: CGFloat) {
        let constraints = [heightAnchor.constraint(equalToConstant: height)]
        NSLayoutConstraint.activate(constraints)
    }
        
    /// 寬度
    /// - Parameter height: CGFloat
    func _width(with width: CGFloat) {
        let constraints = [widthAnchor.constraint(equalToConstant: width)]
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 高度比例
    /// - Parameters:
    ///   - otherView: UIView
    ///   - ratio: 倍率
    ///   - offset: 偏移量
    func _height(by otherView: UIView, ratio: CGFloat, offset: CGFloat) {
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: otherView,
            attribute: .height,
            multiplier: ratio,
            constant: offset
        )
        
        NSLayoutConstraint.activate([constraint])
    }
    
    /// 寬度寬度
    /// - Parameters:
    ///   - otherView: UIView
    ///   - ratio: 倍率
    ///   - offset: 偏移量
    func _width(by otherView: UIView, ratio: CGFloat, offset: CGFloat) {
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: otherView,
            attribute: .width,
            multiplier: ratio,
            constant: offset
        )
        
        NSLayoutConstraint.activate([constraint])
    }
    
    /// 垂直置中
    /// - Parameters:
    ///   - otherView: UIView
    ///   - multiplier: 倍率
    ///   - offset: 偏移量
    func _centerX(by otherView: UIView, multiplier: CGFloat, offset: CGFloat) {
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: otherView,
            attribute: .centerX,
            multiplier: multiplier,
            constant: offset
        )
        
        NSLayoutConstraint.activate([constraint])
    }
    
    /// 水平置中
    /// - Parameters:
    ///   - otherView: UIView
    ///   - multiplier: 倍率
    ///   - offset: 偏移量
    func _centerY(by otherView: UIView, multiplier: CGFloat, offset: CGFloat) {
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: otherView,
            attribute: .centerY,
            multiplier: multiplier,
            constant: offset
        )
        
        NSLayoutConstraint.activate([constraint])
    }
    
    /// 自身長寬比 (width:height )
    /// - Parameters:
    ///   - ratio: 倍率
    ///   - offset: 偏差值
    func _aspectRatio(_ ratio: CGFloat, offset: CGFloat) {
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: self,
            attribute: .height,
            multiplier: ratio,
            constant: offset
        )
        
        NSLayoutConstraint.activate([constraint])
    }
}
