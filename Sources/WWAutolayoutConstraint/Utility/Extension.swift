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
    ///   - useSafearea: 使用安全區域
    func _top(by otherView: UIView, yAxis: WWAutolayoutWrapper<UIView>.YAxisType, useSafeArea: Bool) {
        
        let constraints: [NSLayoutConstraint]
        
        switch yAxis {
        case .top(let offset):
            let _topAnchor = useSafeArea ? otherView.safeAreaLayoutGuide.topAnchor : otherView.topAnchor
            constraints = [topAnchor.constraint(equalTo: _topAnchor, constant: offset)]
        case .bottom(let offset):
            let _bottomAnchor = useSafeArea ? otherView.safeAreaLayoutGuide.bottomAnchor : otherView.bottomAnchor
            constraints = [topAnchor.constraint(equalTo: _bottomAnchor, constant: offset)]
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 跟上下方的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - yAxis: 對齊的位置
    ///   - useSafearea: 使用安全區域
    func _bottom(by otherView: UIView, yAxis: WWAutolayoutWrapper<UIView>.YAxisType, useSafeArea: Bool) {
        
        let constraints: [NSLayoutConstraint]
        
        switch yAxis {
        case .top(let offset):
            let _topAnchor = useSafeArea ? otherView.safeAreaLayoutGuide.topAnchor : otherView.topAnchor
            constraints = [bottomAnchor.constraint(equalTo: _topAnchor, constant: offset)]
        case .bottom(let offset):
            let _bottomAnchor = useSafeArea ? otherView.safeAreaLayoutGuide.bottomAnchor : otherView.bottomAnchor
            constraints = [bottomAnchor.constraint(equalTo: _bottomAnchor, constant: offset)]
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 跟左右邊的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - xAxis: 對齊的位置
    ///   - useSafearea: 使用安全區域
    func _left(by otherView: UIView, xAxis: WWAutolayoutWrapper<UIView>.XAxisType, useSafeArea: Bool) {
        
        let constraints: [NSLayoutConstraint]
        
        switch xAxis {
        case .left(let offset):
            let _leadingAnchor = useSafeArea ? otherView.safeAreaLayoutGuide.leadingAnchor : otherView.leadingAnchor
            constraints = [leadingAnchor.constraint(equalTo: _leadingAnchor, constant: offset)]
        case .right(let offset):
            let _trailingAnchor = useSafeArea ? otherView.safeAreaLayoutGuide.trailingAnchor : otherView.trailingAnchor
            constraints = [leadingAnchor.constraint(equalTo: _trailingAnchor, constant: offset)]
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /// 跟左右邊的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - xAxis: 對齊的位置
    ///   - useSafearea: 使用安全區域
    func _right(by otherView: UIView, xAxis: WWAutolayoutWrapper<UIView>.XAxisType, useSafeArea: Bool) {
        
        let constraints: [NSLayoutConstraint]
        
        switch xAxis {
        case .left(let offset):
            let _leadingAnchor = useSafeArea ? safeAreaLayoutGuide.leadingAnchor : otherView.leadingAnchor
            constraints = [trailingAnchor.constraint(equalTo: _leadingAnchor, constant: offset)]
        case .right(let offset):
            let _trailingAnchor = useSafeArea ? safeAreaLayoutGuide.trailingAnchor : otherView.trailingAnchor
            constraints = [trailingAnchor.constraint(equalTo: _trailingAnchor, constant: offset)]
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
    
    /// 自身長寬比 (width:height => 9:16)
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

// MARK: - 更新約束
extension UIView {
    
    /// 更新高度約束
    /// - Parameter height: CGFloat
    func _updateHeight(_ height: CGFloat) {
        _updateConstraint(firstAttribute: .height) { _height(with: height) }
    }
    
    /// 更新寬度約束
    /// - Parameter height: CGFloat
    func _updateWidth(_ width: CGFloat) {
        _updateConstraint(firstAttribute: .width) { _width(with: width) }
    }
}

// MARK: - 更新約束
private extension UIView {
    
    /// 更新約束
    /// - Parameters:
    ///   - firstAttribute: 要更新的屬性
    ///   - clourse: 更新的動作
    func _updateConstraint(firstAttribute: NSLayoutConstraint.Attribute, clourse: () -> Void) {
        
        var canUpdate = false
        
        constraints.forEach {
            
            if ($0.firstAttribute == firstAttribute) {
                $0.isActive = false
                canUpdate = true
            }
        }
        
        if (canUpdate) { clourse() }
    }
}
