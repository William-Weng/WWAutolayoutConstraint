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
    
    /// 跟上方的間距
    /// - Parameters:
    ///   - otherView: UIView
    ///   - top: CGFloat
    func top(by otherView: UIView, top: CGFloat) -> Self {
        finish()
        functionType = .top(otherView, top)
        return self
    }
    
    /// 跟下方的間距
    /// - Parameters:
    ///   - otherView: UIView
    ///   - bottom: CGFloat
    func bottom(by otherView: UIView, bottom: CGFloat) -> Self {
        finish()
        functionType = .bottom(otherView, bottom)
        return self
    }
    
    /// 跟左邊的間距
    /// - Parameters:
    ///   - otherView: UIView
    ///   - bottom: CGFloat
    func left(by otherView: UIView, left: CGFloat) -> Self {
        finish()
        functionType = .left(otherView, left)
        return self
    }
    
    /// 跟右邊的間距
    /// - Parameters:
    ///   - otherView: UIView
    ///   - right: CGFloat
    func right(by otherView: UIView, left: CGFloat) -> Self {
        finish()
        functionType = .left(otherView, left)
        return self
    }
    
    /// 高度
    /// - Parameter height: CGFloat
    func height(_ height: CGFloat) -> Self {
        finish()
        functionType = .height(height)
        return self
    }
    
    /// 寬度
    /// - Parameter height: CGFloat
    func width(_ width: CGFloat) -> Self {
        finish()
        functionType = .width(width)
        return self
    }
        
    /// 垂直置中
    /// - Parameters:
    ///   - otherView: UIView
    ///   - multiplier: 倍率
    func centerX(by otherView: UIView, multiplier: CGFloat = 1.0, offset: CGFloat = 0) -> Self {
        finish()
        functionType = .centerX(otherView, multiplier, offset)
        return self
    }
    
    /// 水平置中
    /// - Parameters:
    ///   - otherView: UIView
    ///   - multiplier: 倍率
    func centerY(by otherView: UIView, multiplier: CGFloat = 1.0, offset: CGFloat = 0) -> Self {
        finish()
        functionType = .centerY(otherView, multiplier, offset)
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
        case .top(let superView, let top): view._top(by: superView, top: top)
        case .bottom(let superView, let bottom): view._bottom(by: superView, bottom: bottom)
        case .left(let superView, let left): view._left(by: superView, left: left)
        case .right(let superView, let right): view._right(by: superView, right: right)
        case .height(let height): view._height(with: height)
        case .width(let width): view._width(with: width)
        case .centerX(let otherView, let multiplier, let offset): view._centerX(by: otherView, multiplier: multiplier, offset: offset)
        case .centerY(let otherView, let multiplier, let offset): view._centerY(by: otherView, multiplier: multiplier, offset: offset)
        }
        
        self.functionType = nil
    }
}
