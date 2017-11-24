//
//  CorrectViewController.swift
//  DrawingUnitCircle
//
//  Created by CheckoutUser on 11/18/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class CorrectViewController: UIViewController {

    var angle = CGFloat(0)
    var labelText = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var UnitCircleView: UnitCircleView!
    
    @IBAction func arrowPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UnitCircleView.angle = angle
        UnitCircleView.isUserInteractionEnabled = false
        questionLabel.text = labelText
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    


}
