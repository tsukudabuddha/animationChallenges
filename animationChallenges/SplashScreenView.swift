//
//  stackLoadingView.swift
//  animationChallenges
//
//  Created by Andrew Tsukuda on 5/9/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit

enum TransitionType {
    case fadeOnly // default
}

enum LineOrientation {
    case vertical
    case horizontal
}

class SplashScreenView: UIView {
    
    private var imageView: UIImageView!
    var orientation: LineOrientation = .horizontal  // Vertical or Horizontal Lines
    var lineCount: Int = 10  // Number of lines
    var lineAnimationDuration: Double = 0.5
    
    init(frame: CGRect, logoColor: UIColor, logoSize: CGSize, logoName: String) {
        super.init(frame: frame)
        backgroundColor = logoColor
        
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
        self.imageView.image = UIImage(named: "apple")
        let lineHeight = bounds.maxY / CGFloat(lineCount)
        let lineWidth = bounds.maxX
        
        for i in 0...lineCount {
            let lineFrame = CGRect(x: 0, y: (self.bounds.minY + (CGFloat(i) * lineHeight)), width: lineWidth, height: lineHeight)
            let lineView = UIView(frame: lineFrame)
            lineView.backgroundColor = UIColor.clear
            addSubview(lineView)
            sendSubview(toBack: lineView)
            let delay: TimeInterval = 1 + (0.05 * Double(i)) + Double(1 / Double(lineCount))
            lineAnimationDuration = 0.5
            UIView.animate(withDuration: lineAnimationDuration, delay: delay, options: [], animations: {
                lineView.backgroundColor = UIColor.white
            }, completion: nil)
            if i == (lineCount - 1) {
                animateLogo()
            }
        }
    }
    
    func animateLogo() {
        /* Make Logo dissappear */
        let logoDelay = 1 + (0.05 * Double(lineCount)) + Double(1 / Double(lineCount))
        // Shrink
        UIView.animate(withDuration: 0.2, delay: logoDelay, options: [], animations: {
            self.imageView.frame = self.imageView.frame.insetBy(dx: 10, dy: 10)
        }, completion: { (complete) in
            
            // Grow and fade
            UIView.animate(withDuration: 0.6, delay: 0, options: [], animations: {
                self.imageView.frame = self.imageView.frame.insetBy(dx: -50, dy: -50)
                self.imageView.layer.opacity = 0
            }, completion: nil)
        })
    }
}
