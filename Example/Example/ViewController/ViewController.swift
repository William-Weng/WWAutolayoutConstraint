//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2025/10/29.
//

import UIKit
import WWAutolayoutConstraint

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
