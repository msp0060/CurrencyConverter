//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Shane Peek on 2/13/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdEntered: UITextField!
    @IBOutlet weak var numberError: UILabel! // Added
    
    @IBOutlet weak var convertButton: UIButton! // Added
    
    var converterLogic = CurrencyConverterLogic()
    var usdAmount = ""
    var canadianAmount = ""
    var italianAmount = ""
    var mexicanAmount = ""
    var chineseAmount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm() // Added
        // Do any additional setup after loading the view.
    }

    // Added function
    func resetForm() {
        convertButton.isEnabled = false
        
        numberError.isHidden = false
        
        numberError.text = "Required"
        
        usdEntered.text = usdEntered.text
    }
    
    // Validate that the text is in fact an Integer number as text is entered
    // and sets an error message flag if it is not.
    @IBAction func numberChanged(_ sender: Any) {
        if let enteredNumber = usdEntered.text {
            if let errorMessage = converterLogic.invalidNumber(enteredNumber) {
                numberError.text = errorMessage
                numberError.textColor = UIColor.red
                numberError.isHidden = false
            } else {
                numberError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    // Used to confirm that the textfield data is valid entry prior to enabling the convert button
     func checkForValidForm() {
         if numberError.isHidden {
             convertButton.isEnabled = true
         } else {
             convertButton.isEnabled = false
         }
     }
    
    @IBAction func canadianOn(_ sender: UISwitch) {
        converterLogic.canadianSetSwitch(sender.isOn)
    }
    
    @IBAction func italianOn(_ sender: UISwitch) {
        converterLogic.italianSetSwitch(sender.isOn)
    }
    
    @IBAction func mexicanOn(_ sender: UISwitch) {
        converterLogic.mexicanSetSwitch(sender.isOn)
    }
    
    @IBAction func chineseOn(_ sender: UISwitch) {
        converterLogic.chineseSetSwitch(sender.isOn)
    }
    
    @IBAction func convert(_ sender: UIButton) {
        
        let usdAmount = usdEntered.text
        canadianAmount = converterLogic.convertCanadian(usdEntered: usdAmount!)
        italianAmount = converterLogic.convertItalian(usdEntered: usdAmount!)
        mexicanAmount = converterLogic.convertMexican(usdEntered: usdAmount!)
        chineseAmount = converterLogic.convertChinese(usdEntered: usdAmount!)
        resetForm() // added
        self.performSegue(withIdentifier: "toCurrencyConverter", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toCurrencyConverter" {
            let navigation = segue.destination as! CurrencyConvertedView
            navigation.usdAmount = usdEntered.text!
            navigation.canadianAmount = canadianAmount
            navigation.italianAmount = italianAmount
            navigation.mexicanAmount = mexicanAmount
            navigation.chineseAmount = chineseAmount
        }
    }
    
}

