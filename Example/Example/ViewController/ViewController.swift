//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2025/10/29.
//

import UIKit
import WWAutolayoutConstraint

final class ViewController: UIViewController {
    
    private lazy var coverView: UIView = {
        
        let coverView = UIView()
        coverView.backgroundColor = .systemOrange
        self.view.addSubview(coverView)
        
        return coverView
    }()
    
    private lazy var centerView = {
        
        let centerView = UIView()
        centerView.backgroundColor = .yellow
        self.view.addSubview(centerView)
        
        return centerView
    }()
    
    @IBAction func coverAction(_ sender: UIBarButtonItem) {
        coverView.autolayout.cover(on: view)
    }
    
    @IBAction func centerAction(_ sender: UIBarButtonItem) {
        centerView.autolayout
            .centerX(by: view)
            .centerY(by: view, multiplier: 0.5)
            .height(100)
            .width(100)
            .finish()
    }
}
