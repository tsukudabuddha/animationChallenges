//
//  SlideInView.swift
//  animationChallenges
//
//  Created by Andrew Tsukuda on 5/8/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit

class SlideInView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let box = UIView()
        let width = box.frame.maxX / 5
        let height = width
        box.backgroundColor = UIColor.red
        box.frame = CGRect(x: 0, y: frame.maxY + height, width: width, height: height)
        addSubview(box)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .autoreverse, animations: {
            box.frame = CGRect(x: box.frame.minX, y: box.frame.minY + height, width: width, height: height)
        }, completion: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
