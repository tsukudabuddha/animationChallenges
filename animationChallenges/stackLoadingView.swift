//
//  stackLoadingView.swift
//  animationChallenges
//
//  Created by Andrew Tsukuda on 5/9/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit

class StackLoadingView: UIView {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black
        animateLines2()
        
        let imageView = UIImageView(image: UIImage(named: "apple"))
        let width: CGFloat = 200
        let height: CGFloat = 200
        let x = bounds.midX - (0.5 * width)
        let y = bounds.midY - (0.5 * height)
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.imageView = imageView
        addSubview(self.imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateLines() {
        let lineCount = 10
        let lineHeight = bounds.maxY / CGFloat(lineCount)
        let lineWidth = bounds.maxX
        
        for i in 0...lineCount {
            let lineFrame = CGRect(x: 0, y: (bounds.maxY + lineHeight), width: lineWidth, height: lineHeight)
            let lineView = UIView(frame: lineFrame)
            addSubview(lineView)
            let delay: TimeInterval = 0.3 * Double(i)
            UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: {
                lineView.frame = CGRect(x: 0, y: (self.bounds.minY + (CGFloat(i) * lineHeight)), width: lineWidth, height: lineHeight)
                lineView.backgroundColor = UIColor.white
            }, completion: nil)
            
        }
    }
    
    func animateLines2() {
        let lineCount = 10
        let lineHeight = bounds.maxY / CGFloat(lineCount)
        let lineWidth = bounds.maxX
        
        for i in 0...lineCount {
            let lineFrame = CGRect(x: 0, y: (self.bounds.minY + (CGFloat(i) * lineHeight)), width: lineWidth, height: lineHeight)
            let lineView = UIView(frame: lineFrame)
            lineView.backgroundColor = UIColor.clear
            addSubview(lineView)
            let delay: TimeInterval = 1 + (0.1 * Double(i))
            let duration = 0.5
            UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
                lineView.backgroundColor = UIColor.white
            }, completion: { (complete) in
                /* Make Logo dissappear */
                
                // Shrink
                UIView.animate(withDuration: 0.2, delay: duration, options: [], animations: {
                    self.imageView.frame = self.imageView.frame.insetBy(dx: 10, dy: 10)
                }, completion: { (complete) in
                    
                    // Grow and fade
                    UIView.animate(withDuration: 0.6, delay: 0, options: [], animations: {
                        self.imageView.frame = self.imageView.frame.insetBy(dx: -50, dy: -50)
                        self.imageView.layer.opacity = 0
                    }, completion: nil)
                })
            })
        }
    }
}
