//
//  ViewController.swift
//  ProgressViewHUD
//
//  Created by MisterHoo on 08/08/2018.
//  Copyright (c) 2018 MisterHoo. All rights reserved.
//

import UIKit
import ProgressViewHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        show(progressValue: 100, maxValue: 200)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let shapeLayer = CAShapeLayer()
    
    func show(progressValue : Float, maxValue : Float){
        let percentage = progressValue / maxValue * 100
        let radius =  percentage / 100 * 2
        
        let backgroundShapeLayer = CAShapeLayer()
        let center = view.center
        let backgroundCircularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        backgroundShapeLayer.path = backgroundCircularPath.cgPath
        backgroundShapeLayer.strokeColor = UIColor.gray.cgColor
        backgroundShapeLayer.lineWidth = 10
        backgroundShapeLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(backgroundShapeLayer)
        
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: CGFloat(radius) * CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        //shapeLayer.strokeEnd = CGFloat(percentage)
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(shapeLayer)
        
        //view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc func handleTap(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey : "basic")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

