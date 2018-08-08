//
//  ProgressViewHUD.swift
//  Pods-ProgressViewHUD_Example
//
//  Created by Yosua Hoo on 08/08/18.
//

import Foundation

public class lingkaranMuter{
    let view : UIView
    
    private init(view: UIView) {
        self.view = view
    }
    
    public func show(progressValue : Float, maxValue : Float){
        
        let percentage = progressValue / maxValue
        let radius =  percentage / 100 * 2
        
        let backgroundShapeLayer = CAShapeLayer()
        let center = view.center
        let backgroundCircularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        backgroundShapeLayer.path = backgroundCircularPath.cgPath
        backgroundShapeLayer.strokeColor = UIColor.gray.cgColor
        backgroundShapeLayer.lineWidth = 10
        backgroundShapeLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(backgroundShapeLayer)
        
        let shapeLayer = CAShapeLayer()

        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: CGFloat(radius) * CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        //shapeLayer.strokeEnd = CGFloat(percentage)
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(shapeLayer)
        
        //view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
}
