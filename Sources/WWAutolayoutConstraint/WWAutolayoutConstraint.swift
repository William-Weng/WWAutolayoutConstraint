//
//  WWAutolayoutConstraint.swift
//  WWAutolayoutConstraint
//
//  Created by William.Weng on 2025/11/4.
//

import UIKit

// MARK: - 簡單的使用NSLayoutConstraint
open class WWAutolayoutWrapper<T: UIView> {
    
    private var view: T
    private var functionType: FunctionType? = nil
    
    /// 功能初始化
    /// - Parameters:
    ///   - view: T
    ///   - functionType: FunctionType?
    public init(_ view: T, functionType: FunctionType? = nil) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view = view
        self.functionType = functionType
    }
}

// MARK: - 公開函式
public extension WWAutolayoutWrapper {
    
    /// 跟上下方的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - yAxis: 對齊的位置
    ///   - useSafearea: 使用安全區域
    /// - Returns: Self
    func top(by otherView: UIView, yAxis: WWAutolayoutWrapper<UIView>.YAxisType = .top(0), useSafeArea: Bool = false) -> Self {
        finish()
        functionType = .top(otherView, yAxis, useSafeArea)
        return self
    }
    
    /// 跟上下方的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - yAxis: 對齊的位置
    ///   - useSafearea: 使用安全區域
    /// - Returns: Self
    func bottom(by otherView: UIView, yAxis: WWAutolayoutWrapper<UIView>.YAxisType = .bottom(0), useSafeArea: Bool = false) -> Self {
        finish()
        functionType = .bottom(otherView, yAxis, useSafeArea)
        return self
    }
    
    /// 跟左右邊的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - xAxis: 對齊的位置
    ///   - useSafearea: 使用安全區域
    /// - Returns: Self
    func leading(by otherView: UIView, xAxis: WWAutolayoutWrapper<UIView>.XAxisType = .left(0), useSafeArea: Bool = false) -> Self {
        finish()
        functionType = .leading(otherView, xAxis, useSafeArea)
        return self
    }
    
    /// 跟左右邊的間距
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - xAxis: 對齊的位置
    ///   - useSafearea: 使用安全區域
    /// - Returns: Self
    func trailing(by otherView: UIView, xAxis: WWAutolayoutWrapper<UIView>.XAxisType = .right(0), useSafeArea: Bool = false) -> Self {
        finish()
        functionType = .trailing(otherView, xAxis, useSafeArea)
        return self
    }
    
    /// 高度
    /// - Parameter height: 高度
    /// - Returns: Self
    func height(_ height: CGFloat) -> Self {
        finish()
        functionType = .height(height)
        return self
    }
    
    /// 寬度
    /// - Parameter height: 寬度
    /// - Returns: Self
    func width(_ width: CGFloat) -> Self {
        finish()
        functionType = .width(width)
        return self
    }
        
    /// 高度比例
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - ratio: 倍率
    ///   - offset: 偏差值
    /// - Returns: Self
    func height(by otherView: UIView, ratio: CGFloat = 1.0, offset: CGFloat = 0) -> Self {
        finish()
        functionType = .heightRatio(otherView, ratio, offset)
        return self
    }
    
    /// 寬度比例
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - ratio: 倍率
    ///   - offset: 偏差值
    /// - Returns: Self
    func width(by otherView: UIView, ratio: CGFloat = 1.0, offset: CGFloat = 0) -> Self {
        finish()
        functionType = .widthRatio(otherView, ratio, offset)
        return self
    }
    
    /// 自身長寬比
    /// - Parameters:
    ///   - ratio: 倍率
    ///   - offset: 偏差值
    /// - Returns: Self
    func aspect(ratio: CGFloat, offset: CGFloat = 0) -> Self {
        finish()
        functionType = .aspectRatio(ratio, offset)
        return self
    }
    
    /// 垂直置中
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - multiplier: 倍率
    ///   - offset: 偏差值
    /// - Returns: Self
    func centerX(by otherView: UIView, multiplier: CGFloat = 1.0, offset: CGFloat = 0) -> Self {
        finish()
        functionType = .centerX(otherView, multiplier, offset)
        return self
    }
    
    /// 水平置中
    /// - Parameters:
    ///   - otherView: 要對齊的UIView
    ///   - multiplier: 倍率
    ///   - offset: 偏差值
    /// - Returns: Self
    func centerY(by otherView: UIView, multiplier: CGFloat = 1.0, offset: CGFloat = 0) -> Self {
        finish()
        functionType = .centerY(otherView, multiplier, offset)
        return self
    }
}

// MARK: - 公開函式
public extension WWAutolayoutWrapper {
    
    /// 更新上下約束
    /// - Parameter CGFloat: 約束大小
    func updateTop(_ value: CGFloat) -> Self {
        finish()
        functionType = .update((.top, value))
        return self
    }
    
    /// 更新上下約束
    /// - Parameter CGFloat: 約束大小
    func updateBottom(_ value: CGFloat) -> Self {
        finish()
        functionType = .update((.bottom, value))
        return self
    }
    
    /// 更新左右約束
    /// - Parameter CGFloat: 約束大小
    func updateLeading(_ value: CGFloat) -> Self {
        finish()
        functionType = .update((.leading, value))
        return self
    }
    
    /// 更新左右約束
    /// - Parameter CGFloat: 約束大小
    func updateTrailing(_ value: CGFloat) -> Self {
        finish()
        functionType = .update((.trailing, value))
        return self
    }
    
    /// 更新寬度約束
    /// - Parameter CGFloat: 約束大小
    func updateWidth(_ value: CGFloat) -> Self {
        finish()
        functionType = .update((.width, value))
        return self
    }
    
    /// 更新高度約束
    /// - Parameter CGFloat: 約束大小
    func updateHeight(_ value: CGFloat) -> Self {
        finish()
        functionType = .update((.height, value))
        return self
    }
    
    /// 更新垂直約束
    /// - Parameter CGFloat: 約束大小
    func updateCenterX(_ value: CGFloat) -> Self {
        finish()
        functionType = .update((.centerX, value))
        return self
    }
    
    /// 更新水平約束
    /// - Parameter CGFloat: 約束大小
    func updateCenterY(_ value: CGFloat) -> Self {
        finish()
        functionType = .update((.centerY, value))
        return self
    }
}

// MARK: - 公開函式
public extension WWAutolayoutWrapper {
    
    /// 完全蓋在上面
    /// - Parameter superview: UIView
    /// - Returns: Self
    func cover(on superview: UIView) {
        functionType = .cover(superview)
        finish()
    }
    
    /// 畫面置中
    /// - Parameters:
    ///   - view: UIView
    ///   - top: CGFloat?
    ///   - left: CGFloat?
    /// - Returns: Self
    func center(on superView: UIView, top: CGFloat? = nil, left: CGFloat? = nil) {
        functionType = .center(superView, top, left)
        finish()
    }
}

// MARK: - 公開函式
public extension WWAutolayoutWrapper {
    
    /// 完成結束 + 執行上一次的功能
    func finish() {
        
        guard let functionType = functionType else { return }
        
        switch functionType {
        case .cover(let superView): view._autolayout(on: superView)
        case .center(let superView, let top, let left): view._autolayout(centerOn: superView, top: top, left: left)
        case .top(let superView, let yAxis, let useSafeArea): view._top(by: superView, yAxis: yAxis, useSafeArea: useSafeArea)
        case .bottom(let superView, let yAxis, let useSafeArea): view._bottom(by: superView, yAxis: yAxis, useSafeArea: useSafeArea)
        case .leading(let superView, let xAxis, let useSafeArea): view._left(by: superView, xAxis: xAxis, useSafeArea: useSafeArea)
        case .trailing(let superView, let xAxis, let useSafeArea): view._right(by: superView, xAxis: xAxis, useSafeArea: useSafeArea)
        case .height(let height): view._height(with: height)
        case .width(let width): view._width(with: width)
        case .heightRatio(let otherView, let ratio, let offset): view._height(by: otherView, ratio: ratio, offset: offset)
        case .widthRatio(let otherView, let ratio, let offset): view._width(by: otherView, ratio: ratio, offset: offset)
        case .aspectRatio(let ratio, let offset): view._aspectRatio(ratio, offset: offset)
        case .centerX(let otherView, let multiplier, let offset): view._centerX(by: otherView, multiplier: multiplier, offset: offset)
        case .centerY(let otherView, let multiplier, let offset): view._centerY(by: otherView, multiplier: multiplier, offset: offset)
        case .update(let info): updateConstraint(with: info)
        }
        
        self.functionType = nil
    }
}

// MARK: - 小工具
private extension WWAutolayoutWrapper {
    
    /// 更新約束
    /// - Parameter type: WWAutolayoutWrapper<T>.ConstraintInformation
    func updateConstraint(with info: WWAutolayoutWrapper<T>.ConstraintInformation) {
        
        let attribute: NSLayoutConstraint.Attribute
        let constant: CGFloat
        
        view._findConstraint(attribute: info.type) { constraint in
            guard let constraint = constraint else { return }
            constraint.constant = info.value
        }
    }
}
