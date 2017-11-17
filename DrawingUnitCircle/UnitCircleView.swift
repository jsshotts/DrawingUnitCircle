//
//  UnitCircleView.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/2/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class UnitCircleView: UIView {
    
    
    let π = CGFloat.pi
    
    var angle = CGFloat(0) //put in any angle value here (in radians), why can't I use "π" here?
    
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
        
        self.labelHeight.text = "height: \(abs(sin(angle)))"
        self.labelWidth.text = "width: \(abs(cos(angle)))"
        self.labelAngle.text = "angle: \(angle)"
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
    
//    func createLabelHeight(){
//
//        let height = (sin(angle)).description
//
//        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 120, height: 20))
//        label.text = "height: " + height
//        self.addSubview(label)
//
//    }
//
//    func createLabelWidth(){
//
//        let width = (cos(angle)).description
//
//        let label = UILabel(frame: CGRect(x: 20, y: 40, width: 120, height: 20))
//        label.text = "width: " + width
//        self.addSubview(label)
//    }
//
//    func createLabelAngle(){
//
//        let Angle = angle.description
//
//        let label = UILabel(frame: CGRect(x: 20, y: 60, width: 120, height: 20))
//        label.text = "theta: " + Angle
//        self.addSubview(label)
//
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch?.location(in: self)
        let xdistance = position!.x - self.frame.size.width/2
        let ydistance = -(position!.y - self.frame.size.height/2)
        angle = atan2(ydistance, xdistance)

        self.labelHeight.text = "height: \(sin(angle))"
        self.labelWidth.text = "width: \(cos(angle))"
        self.labelAngle.text = "angle: \(angle)"
        
//        print ("x: \(xdistance)")
//        print ("y: \(ydistance)")
//        print ("atan2: \(atan2(ydistance, xdistance))")
//        print ("touchesBegan called, angle: \(angle)")
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch?.location(in: self)
        let xdistance = position!.x - self.frame.size.width/2
        let ydistance = -(position!.y - self.frame.size.height/2)
        angle = atan2(ydistance, xdistance)
        
        self.labelHeight.text = "height: \(sin(angle))"
        self.labelWidth.text = "width: \(cos(angle))"
        self.labelAngle.text = "angle: \(angle)"
        
//        print ("cos: \(cos(angle))")
//        print ("sin: \(sin(angle))")
        
//        if cos(angle) < 0.00000000000000001 {
//            self.labelWidth.text = "width: 0"
//        }

//        print("touchesMoved()")
//        print ("x: \(xdistance)")
//        print ("y: \(ydistance)")
//        print ("atan2: \(atan2(ydistance, xdistance))")
//        print ("touchesBegan called, angle: \(angle)")
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
