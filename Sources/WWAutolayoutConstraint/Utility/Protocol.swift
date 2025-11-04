//
//  Protocol.swift
//  WWAutolayoutConstraint
//
//  Created by William.Weng on 2025/11/4.
//

import UIKit

// MARK: - WWAutolayoutProtocol
public protocol WWAutolayoutProtocol: UIView {}

// MARK: - WWAutolayoutProtocol
extension WWAutolayoutProtocol {
    public var autolayout: WWAutolayoutWrapper<Self> { return WWAutolayoutWrapper(self) }
}

// MARK: - UIView + WWAutolayoutProtocol
extension UIView: WWAutolayoutProtocol {}
