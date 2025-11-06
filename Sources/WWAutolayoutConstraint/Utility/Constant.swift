//
//  Constant.swift
//  WWAutolayoutConstraint
//
//  Created by William.Weng on 2025/11/4.
//

import UIKit

// MARK: - enum
public extension WWAutolayoutWrapper {
    
    /// 函數類型
    enum FunctionType {
        case cover(_ superView: UIView)
        case center(_ superView: UIView, _ top: CGFloat?, _ left: CGFloat?)
        case top(_ superView: UIView, _ top: CGFloat)
        case bottom(_ superView: UIView, _ bottom: CGFloat)
        case left(_ superView: UIView, _ left: CGFloat)
        case right(_ superView: UIView, _ right: CGFloat)
        case height(_ height: CGFloat)
        case width(_ width: CGFloat)
        case heightRatio(_ otherView: UIView, _ ratio: CGFloat, _ offset: CGFloat)
        case widthRatio(_ otherView: UIView, _ ratio: CGFloat, _ offset: CGFloat)
        case aspectRatio(_ ratio: CGFloat, _ offset: CGFloat)
        case centerX(_ otherView: UIView, _ multiplier: CGFloat, _ offset: CGFloat)
        case centerY(_ otherView: UIView, _ multiplier: CGFloat, _ offset: CGFloat)
    }
}
