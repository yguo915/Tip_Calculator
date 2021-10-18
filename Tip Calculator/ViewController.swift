//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Yijie Guo on 10/14/21.
//

import UIKit

class ViewController: UIViewController,  UITextFieldDelegate{
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.delegate = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateLabel(textField: textField)

    }

    @IBAction func calculateTip(_ sender: Any) {
        updateLabel(textField: billAmountTextField)
    }
    
    func updateLabel(textField: UITextField){
        let bill = Double(textField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text=String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
}

