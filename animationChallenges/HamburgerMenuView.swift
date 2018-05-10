//
//  HamburgerMenuView.swift
//  animationChallenges
//
//  Created by Andrew Tsukuda on 5/9/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit

class HamburgerMenuView: UIView {
    
    var hamburgerButton: UIButton!
    var isToggled: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /* Create Button */
        let buttonFrame = CGRect(x: 20, y: 20, width: 40, height: 40)
        hamburgerButton = UIButton(frame: buttonFrame)
        hamburgerButton.setImage(UIImage(named: "Menu"), for: .normal)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMenu))
        hamburgerButton.addGestureRecognizer(tapRecognizer)
        addSubview(hamburgerButton)
        
       
    }
    
    @objc func showMenu() {
        if isToggled {
            
        } else {
            for i in 0...4 {
                let width = (bounds.height / 5)
                let view = UIView(frame: CGRect(x: (-1 * width) , y: (CGFloat(i) * width), width: width, height: width))
                switch i {
                case 0:
                    view.backgroundColor = UIColor.red
                case 1:
                    view.backgroundColor = UIColor.orange
                case 2:
                    view.backgroundColor = UIColor.yellow
                case 3:
                    view.backgroundColor = UIColor.green
                case 4:
                    view.backgroundColor = UIColor.blue
                default:
                    view.backgroundColor = UIColor.gray
                }
                
                addSubview(view)
                
                let delay = TimeInterval(0.25 * Double(i))
                
                UIView.animate(withDuration: 1, delay: delay, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: [], animations: {
                    view.frame = CGRect(x: 0, y: (CGFloat(i) * width), width: width, height: width)
                }, completion: nil)
            }
        }
        bringSubview(toFront: hamburgerButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
