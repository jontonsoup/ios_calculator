//
//  ViewController.swift
//  ios_calculator
//
//  Created by Jonathan friedman on 8/7/15.
//  Copyright (c) 2015 Jonathan friedman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var totalBill: UILabel!
    @IBOutlet weak var preCalculatedTip: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //billAmount.becomeFirstResponder()
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tipChanged(sender: UISlider) {
        tipPercent.text = String(Int(sender.value))
        preCalculatedTip.selectedSegmentIndex = UISegmentedControlNoSegment

        calculateTip()
    }

    @IBAction func billChanged(sender: UITextField) {
        calculateTip()
    }
    
    @IBAction func preCalculatedTipSelected(sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            var number = "15"
            tipPercent.text = number
            slider.value = (number as NSString).floatValue
            break;
        case 1:
            var number = "18"
            tipPercent.text = number
            slider.value = (number as NSString).floatValue
            break;
        case 2:
            var number = "20"
            tipPercent.text = number
            slider.value = (number as NSString).floatValue
        default:
            break;
        }
        calculateTip()
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func calculateTip() {
        if ((billAmount.text != "") && (tipPercent.text != "")) {
        var total = billAmount.text
        var percent = tipPercent.text
        var totalBillInt:Int? = billAmount.text.toInt()
        var tipPercentdouble = (tipPercent.text! as NSString).doubleValue
            
        var totalString = String(stringInterpolationSegment: Double(totalBillInt!) + (Double(totalBillInt!) * (tipPercentdouble / 100)))
        totalBill.text = "$" + totalString
        }
    }
}

