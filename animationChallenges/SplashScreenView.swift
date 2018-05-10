//
//  stackLoadingView.swift
//  animationChallenges
//
//  Created by Andrew Tsukuda on 5/9/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit

enum TransitionType {
    case lineFade // default
}

class SplashScreenView: UIView {
    
    var imageView: UIImageView!
    var transitionType: TransitionType = .lineFade
    
    init(frame: CGRect, logoColor: UIColor, logoSize: CGSize, logoName: String) {
        super.init(frame: frame)
        backgroundColor = logoColor
        animateLines()
        
        let imageView = UIImageView(image: UIImage(named: logoName))
        let x = bounds.midX - (0.5 * logoSize.width)
        let y = bounds.midY - (0.5 * logoSize.height)
        imageView.frame = CGRect(x: x, y: y, width: logoSize.width, height: logoSize.height)
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
