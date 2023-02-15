//
//  CurrencyConvertedViewViewController.swift
//  CurrencyConverter
//
//  Created by Shane Peek on 2/13/23.
//

import UIKit

class CurrencyConvertedView: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var canadianOutLabel: UILabel!
    @IBOutlet weak var italianOutLabel: UILabel!
    @IBOutlet weak var mexicanOutLabel: UILabel!
    @IBOutlet weak var chineseOutLabel: UILabel!
    
    var usdAmount = ""
    var canadianAmount = ""
    var italianAmount = ""
    var mexicanAmount = ""
    var chineseAmount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabel.text = usdAmount
        canadianOutLabel.text = canadianAmount
        italianOutLabel.text = italianAmount
        mexicanOutLabel.text = mexicanAmount
        chineseOutLabel.text = chineseAmount
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backpressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
