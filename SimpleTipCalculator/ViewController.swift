//
//  ViewController.swift
//  SimpleTipCalculator
//
//  Created by Saira on 9/21/16.
//  Copyright © 2016 Saira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var selectTipControl: UISegmentedControl!
    @IBOutlet weak var totalTipLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.becomeFirstResponder()
    }
    
    /**
     Changes value of segmented control, clears tip text field and recalculates 
     total tip and total bill
     - parameter sender: SegmentControl 
     */
    @IBAction func tipPercentageChanged(sender: AnyObject) {
        tipTextField.text = ""
        calculateTip(sender)
    }
   
    
    /**
     Calculates total tip and total bill on basis of bill & selected tip 
     percentage
     - parameter sender: Calculate Button
     */
    @IBAction func calculateTip(sender: AnyObject) {
        guard let bill = billTextField.text where !bill.isEmpty,
            let billInDouble = Double(bill),
            selectedSegmentTitle = selectTipControl.titleForSegmentAtIndex(selectTipControl.selectedSegmentIndex) else {
                return
        }
        
        /// If tip percentage textfield is empty, pick value from
        /// selected segment else get value from tip textfield
        var tipPercentage: String
        if tipTextField.text!.isEmpty {
             tipPercentage = selectedSegmentTitle.stringByReplacingOccurrencesOfString("%", withString: "")
        } else {
            tipPercentage = tipTextField.text!
        }
        
        guard let tipInDouble = Double(tipPercentage) else {
            return
        }
        
        let totalTip = billInDouble * (tipInDouble/100)
        let totalBill = billInDouble + totalTip
        
        totalTipLabel.text = "Total Tip: \(totalTip)"
        totalBillLabel.text = "Total Bill: \(totalBill)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

