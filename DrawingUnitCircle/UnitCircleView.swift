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
    
    var angle = (5 * CGFloat.pi)/3  //put in any angle value here (in radians), why can't I use "π" here?
    
//        {
//        didSet{setNeedsDisplay()}
//    }
    
    let radius = CGFloat(120.0)       //adjust the radius of the unit circle and all parts adjust with it
    
    
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor.lightGray
        print ("setBackgroundColor()")
    }
    
    func drawUnitCircle(radius: CGFloat) {
        
        let context = UIGraphicsGetCurrentContext()  //What does this function do?
        
        //why does context need a ?. Is context an optional?
        //if it is an optional, where do we unwrap it?
       
        context?.addArc(center: CGPoint(x:self.frame.size.width/2, y:self.frame.size.height/2), radius: radius, startAngle: 0, endAngle: 2*π, clockwise: true)
        
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.strokePath()
    }
    
    func drawLines(radius : CGFloat) {
        
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
        
        context?.addArc(center: CGPoint(x: x2, y: CGFloat(self.frame.size.height) - y2), radius: 4, startAngle: 0, endAngle: 2*π, clockwise: true)
        
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.strokePath()
        
        
    }
    
    func createLabelHeight(){
        
        let height = (sin(angle)).description
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 120, height: 20))
        label.text = "height: " + height
        self.addSubview(label)
        
    }
    
    func createLabelWidth(){
        
        let width = (cos(angle)).description
        
        let label = UILabel(frame: CGRect(x: 20, y: 40, width: 120, height: 20))
        label.text = "width: " + width
        self.addSubview(label)
    }
    
    func createLabelAngle(){
        
        let Angle = angle.description
        
        let label = UILabel(frame: CGRect(x: 20, y: 60, width: 120, height: 20))
        label.text = "theta: " + Angle
        self.addSubview(label)
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        let position = touch?.location(in: self)
//        let xdistance = position!.x - self.frame.size.width/2
//        let ydistance = position!.y - self.frame.size.height/2
//        angle = atan2(xdistance, ydistance)
//        print ("touchesBegan called, angle: \(angle)")
//    }

    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        drawUnitCircle(radius: radius)
        drawLines(radius: radius)
        drawSmallCircle()
    }
}
