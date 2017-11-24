//
//  UnitCircleView.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/2/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class UnitCircleView: UIView {
    
    var angle = CGFloat(0)
    
        {
        didSet{setNeedsDisplay()}
    }
    
    var radius = CGFloat(120)
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor.lightGray
    }
    
    let labelHeight = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: 20))
    let labelWidth = UILabel(frame: CGRect(x: 20, y: 40, width: 140, height: 20))
    let labelAngle = UILabel(frame: CGRect(x: 20, y: 60, width: 140, height: 20))

    
    func drawUnitCircle() {
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.addArc(center: CGPoint(x:self.frame.size.width/2, y:self.frame.size.height/2), radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.strokePath()
        
    }
    
    func drawLines() {
        
        let centerx = CGFloat(self.frame.size.width/2)
        let centery = CGFloat(self.frame.size.height/2)
        
        let x2 = (radius * cos(angle)) + centerx
        let y2 = (radius * sin(angle)) + centery
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: centerx, y: centery))
        context?.addLine(to: CGPoint(x: x2, y: centery))
        context?.addLine(to: CGPoint(x: x2, y: CGFloat(self.frame.size.height) - y2))
        context?.addLine(to: CGPoint(x: centerx, y: centery))
        
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.strokePath()
        
    }
    
    func drawSmallCircle(){
        
        
        let centerx = CGFloat(self.frame.size.width/2)
        let centery = CGFloat(self.frame.size.height/2)
        
        let x2 = (radius * cos(angle)) + centerx
        let y2 = (radius * sin(angle)) + centery
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.addArc(center: CGPoint(x: x2, y: CGFloat(self.frame.size.height) - y2), radius: 4, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.strokePath()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch?.location(in: self)
        let xdistance = position!.x - self.frame.size.width/2
        let ydistance = -(position!.y - self.frame.size.height/2)
        angle = atan2(ydistance, xdistance)

        self.labelAngle.text = "angle: \(angle)"
        
        if cos(angle) >= 0{
            if cos(angle) < 0.00000000001{
                self.labelWidth.text = "width: 0"
            }
            else{
                self.labelWidth.text = "width: \(abs(cos(angle)))"
            }
        }
        if cos(angle) < 0{
            if cos(angle) > -0.000000000001{
                self.labelWidth.text = "width: 0"
            }
            else{
                self.labelWidth.text = "width: \(abs(cos(angle)))"
            }
        }
        if sin(angle) >= 0{
            if sin(angle) < 0.00000000001{
                self.labelHeight.text = "height: 0"
            }
            else{
                self.labelHeight.text = "height: \(abs(sin(angle)))"
            }
        }
        if sin(angle) < 0{
            if sin(angle) > -0.00000000001{
                self.labelHeight.text = "height: 0"
            }
            else{
                self.labelHeight.text = "height: \(abs(sin(angle)))"
            }
        }
        
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch?.location(in: self)
        let xdistance = position!.x - self.frame.size.width/2
        let ydistance = -(position!.y - self.frame.size.height/2)
        angle = atan2(ydistance, xdistance)

        self.labelAngle.text = "angle: \(angle)"


        if cos(angle) >= 0{
            if cos(angle) < 0.00000000001{
                self.labelWidth.text = "width: 0"
            }
            else{
                self.labelWidth.text = "width: \(abs(cos(angle)))"
            }
        }
        if cos(angle) < 0{
            if cos(angle) > -0.000000000001{
                self.labelWidth.text = "width: 0"
            }
            else{
                self.labelWidth.text = "width: \(abs(cos(angle)))"
            }
        }
        if sin(angle) >= 0{
            if sin(angle) < 0.00000000001{
                self.labelHeight.text = "height: 0"
            }
            else{
                self.labelHeight.text = "height: \(abs(sin(angle)))"
            }
        }
        if sin(angle) < 0{
            if sin(angle) > -0.00000000001{
                self.labelHeight.text = "height: 0"
            }
            else{
                self.labelHeight.text = "height: \(abs(sin(angle)))"
            }
        }
    
    }

    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        drawUnitCircle()
        drawLines()
        drawSmallCircle()

    }
}
