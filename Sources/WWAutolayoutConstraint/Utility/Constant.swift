//
//  Constant.swift
//  WWAutolayoutConstraint
//
//  Created by William.Weng on 2025/11/4.
//

import UIKit

// MARK: - enum
public extension WWAutolayoutWrapper {
        
    /// X軸位置 + 偏移量
    enum XAxisType {
        case left(_ offset: CGFloat)
        case right(_ offset: CGFloat)
    }
    
    /// Y軸位置 + 偏移量
    enum YAxisType {
        case top(_ offset: CGFloat)
        case bottom(_ offset: CGFloat)
    }
    
    /// 函數類型
    enum FunctionType {
        case cover(_ superView: UIView)
        case center(_ superView: UIView, _ top: CGFloat?, _ left: CGFloat?)
        case top(_ superView: UIView, _ yAxis: WWAutolayoutWrapper<UIView>.YAxisType, _ useSafeArea: Bool)
        case bottom(_ superView: UIView, _ yAxis: WWAutolayoutWrapper<UIView>.YAxisType, _ useSafeArea: Bool)
        case left(_ superView: UIView, _ xAxis: WWAutolayoutWrapper<UIView>.XAxisType, _ useSafeArea: Bool)
        case right(_ superView: UIView, _ xAxis: WWAutolayoutWrapper<UIView>.XAxisType, _ useSafeArea: Bool)
        case height(_ height: CGFloat)
        case width(_ width: CGFloat)
        case heightRatio(_ otherView: UIView, _ ratio: CGFloat, _ offset: CGFloat)
        case widthRatio(_ otherView: UIView, _ ratio: CGFloat, _ offset: CGFloat)
        case aspectRatio(_ ratio: CGFloat, _ offset: CGFloat)
        case centerX(_ otherView: UIView, _ multiplier: CGFloat, _ offset: CGFloat)
        case centerY(_ otherView: UIView, _ multiplier: CGFloat, _ offset: CGFloat)
    }
}
