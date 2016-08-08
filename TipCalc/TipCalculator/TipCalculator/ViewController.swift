//
//  ViewController.swift
//  TipCalculator
//
//  Created by Mac on 8/6/16.
//  Copyright © 2016 ElenaSidyakina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - @IBOutlets

    @IBOutlet weak var tipsyTitleView: UIView!
    @IBOutlet weak var tipsyTitleLabel: UILabel!
    @IBOutlet weak var billAmountTF: UITextField!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var eachAmountLabel: UILabel!
    @IBOutlet weak var eachAmount: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
   
        tipPercentValue()
        splitByValue()
       
       
    }
    

    
    
   //Properties...We create an instance of our model here.
    
    var tipCalc = TipCalc(billAmount: 0.0, tipPercent: 0.0)
    var eachCalc = TipCalc(eachAmount: 0.0, splitBy: 0.0)
    
    
    
   //IBActions
    
    @IBAction func billAmountChanges(_ sender: AnyObject) {
        
        calcTip()
        
    }
    @IBAction func tipPercentChanges(_ sender: AnyObject) {
        tipPercentValue()
        calcTip()
      
        
    }
    
   
    
    
    @IBAction func splitAmountChanged(_ sender: AnyObject) {
        
        splitByValue()
        calcEach()
        
        
    }
    
    
    //Functions
    
    func calcTip() {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        tipCalc.billAmount = ((billAmountTF.text)! as NSString).doubleValue
        
        tipCalc.calculateTip()
        updateUI()
    }
    
    func calcEach() {
       
        eachCalc.splitBy = Double(splitSlider.value)
        
        eachCalc.eachAmount = Double(tipCalc.totalAmount) / eachCalc.splitBy
        updateUI()
        
    }
  
    
    
    
    //We need to implement function
    //to update the UI we create a function

    
    func updateUI() {
        tipAmountLabel.text = String(format: "$%0.2f", tipCalc.tipAmount)
        
        totalAmountLabel.text = String(format: "$%0.2f", tipCalc.totalAmount)
      
       
        eachAmount.text = String(format:"$%0.2f", eachCalc.eachAmount)
        

    }
    
    func tipPercentValue() {
        
        tipPercentLbl.text = "TIP \(Int(tipPercentSlider.value * 100))%"
    }
    
    func splitByValue() {
        
        splitLabel.text = "SPLIT \(Int(splitSlider.value))"
    }
    
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
 
    
    
   
    

}

