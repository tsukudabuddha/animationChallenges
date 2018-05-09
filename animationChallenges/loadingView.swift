//
//  loadingView.swift
//  animationChallenges
//
//  Created by Andrew Tsukuda on 5/9/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    var topRight: CGPoint {
        return CGPoint(x: bounds.maxX, y: bounds.maxY)
    }
    
    var bottomLeft: CGPoint {
        return CGPoint(x: bounds.minX, y: bounds.minY)
    }
    
    var bottomRight: CGPoint {
        return CGPoint(x: bounds.maxX, y: bounds.minY)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        animateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateView() {
        let path = UIBezierPath()
        path.move(to: center)
        path.addLine(to: topRight)
        
        let shape = CAShapeLayer()
        shape.path = UIBezierPath.init(rect: bounds).cgPath
        shape.strokeColor = UIColor.cyan.cgColor
        shape.lineWidth = 5
        shape.backgroundColor = UIColor.clear.cgColor
        shape.lineCap = kCALineCapRound
        shape.cornerRadius = 45
    
        layer.addSublayer(shape)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 4
        animation.fromValue = 0
        animation.toValue = 1
        shape.add(animation, forKey: "anim")
    }
}
