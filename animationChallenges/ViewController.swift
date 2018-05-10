//
//  ViewController.swift
//  animationChallenges
//
//  Created by Andrew Tsukuda on 5/8/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let loadingFrame = CGRect(x: view.frame.midX, y: view.frame.midY, width: 100, height: 100)
        let loading = StackLoadingView(frame: view.frame)
        view.addSubview(loading)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBottomBoxesAnimated() {
        for i in 0...4 {
            let width = (self.view.frame.width / 5)
            let view = UIView(frame: CGRect(x: CGFloat(i) * width , y: self.view.frame.maxY, width: width, height: width))
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
            
            self.view.addSubview(view)
            
            let delay = 0.25 * CGFloat(i)
            UIView.animate(withDuration: 1, delay: TimeInterval(delay), options: [], animations: {
                view.frame = CGRect(x: CGFloat(i) * width, y: self.view.frame.maxY - width, width: width, height: width)
            }, completion: nil)
            
        }
    }
    
    func createBottomBoxesAnimatedBounce() {
        for i in 0...4 {
            let width = (self.view.frame.width / 5)
            let view = UIView(frame: CGRect(x: CGFloat(i) * width , y: self.view.frame.maxY, width: width, height: width))
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
            
            self.view.addSubview(view)
            
            let delay = TimeInterval(0.25 * Double(i))
            
            UIView.animate(withDuration: 1, delay: delay, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: [], animations: {
                view.frame = CGRect(x: CGFloat(i) * width, y: self.view.frame.maxY - width, width: width, height: width)
            }, completion: createUpperView)
        }
    }
    
    func createUpperView(_: Bool) {
        let y = (self.view.frame.maxY - (self.view.frame.width / 5))
        let view = UIView(frame: CGRect(x: 0, y: y - 100, width: self.view.frame.width, height: 100))
        
        let boldView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        boldView.backgroundColor = UIColor.gray
        let boldLabel = UILabel(frame: CGRect(x: self.view.frame.midX, y: boldView.bounds.minY, width: boldView.bounds.width, height: boldView.bounds.height))
        boldLabel.text = "This Is a Bold Label"
        boldLabel.font = UIFont.boldSystemFont(ofSize: 12)
        view.addSubview(boldView)
        boldView.addSubview(boldLabel)
        
        self.view.addSubview(view)
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            boldView.backgroundColor = UIColor.gray
        }, completion: nil)
        
    }


}

