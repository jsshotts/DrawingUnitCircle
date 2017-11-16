//
//  ViewController.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/2/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad()")
        let canvasView = UnitCircleView(frame: CGRect(x:0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height/2))
        canvasView.setBackgroundColor() //I created a UIView programmatically using my UnitCircleView class
        canvasView.createLabelHeight()
        canvasView.createLabelWidth()
        canvasView.createLabelAngle()
        view.addSubview(canvasView)
        canvasView.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

