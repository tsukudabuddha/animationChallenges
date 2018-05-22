//
//  UILabel+animations.swift
//  animationChallenges
//
//  Created by Andrew Tsukuda on 5/22/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit


extension UILabel {
    
    @objc func strikeOut() {
        
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        let startPoint = CGPoint(x: self.bounds.minX - 5, y: self.bounds.midY)
        path.move(to: startPoint)
        var endPoint = startPoint
        endPoint.x = self.bounds.maxX + 5
        path.addLine(to: endPoint)
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2
        
        let animateLine = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        animateLine.fromValue = 0
        animateLine.toValue = 1
        shapeLayer.add(animateLine, forKey: "animateLine")
        
        layer.addSublayer(shapeLayer)
    }
}
