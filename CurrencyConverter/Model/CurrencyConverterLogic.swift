//
//  CurrencyConvertLogic.swift
//  CurrencyConverter
//
//  Created by Shane Peek on 2/13/23.
//

import Foundation

struct CurrencyConverterLogic {
    
    var canadianSwitch = true
    var italianSwitch = true
    var mexicanSwitch = true
    var chineseSwitch = true
    var canadianAmountNum = 1.00
    var italianAmountNum = 1.00
    var mexicanAmountNum = 1.00
    var chineseAmountNum = 1.00
    var canadianAmount = ""
    var italianAmount = ""
    var mexicanAmount = ""
    var chineseAmount = ""
    
    mutating func canadianSetSwitch(_ cSwitchValue: Bool) {
        if cSwitchValue {
            canadianSwitch = true
        } else {
            canadianSwitch = false
        }
    }
    
    mutating func italianSetSwitch(_ iSwitchValue: Bool) {
        if iSwitchValue {
            italianSwitch = true
        } else {
            italianSwitch = false
        }
    }
    
    mutating func mexicanSetSwitch(_ mSwitchValue: Bool) {
        if mSwitchValue {
            mexicanSwitch = true
        } else {
            mexicanSwitch = false
        }
    }
    
    mutating func chineseSetSwitch(_ chSwitchValue: Bool) {
        if chSwitchValue {
            chineseSwitch = true
        } else {
            chineseSwitch = false
        }
    }
    
    mutating func convertCanadian(usdEntered: String) -> String {
        // As of 2/13/2023 conversion rate is 1.34 Canadian to 1 USD
        if canadianSwitch {
            canadianAmountNum = (Double(usdEntered)! * 1.34)
            canadianAmount = String(format: "%.0f", canadianAmountNum)
            return canadianAmount
        } else {
            canadianAmount = "N/A"
            return canadianAmount
        }
    }
    
    mutating func convertItalian(usdEntered: String) -> String {
        // As of 2/13/2023 conversion rate is 0.93 Euro to 1 USD
        if italianSwitch {
            italianAmountNum = (Double(usdEntered)! * 0.93)
            italianAmount = String(format: "%.0f", italianAmountNum)
            return italianAmount
        } else {
            italianAmount = "N/A"
            return italianAmount
        }
    }
    
    mutating func convertMexican(usdEntered: String) -> String {
        // As of 2/13/2023 conversion rate is 18.58 Peso to 1 USD
        if mexicanSwitch {
            mexicanAmountNum = (Double(usdEntered)! * 18.58)
            mexicanAmount = String(format: "%.0f", mexicanAmountNum)
            return mexicanAmount
        } else {
            mexicanAmount = "N/A"
            return mexicanAmount
        }
    }
    
    mutating func convertChinese(usdEntered: String) -> String {
        // As of 2/13/2023 conversion rate is 6.82 RMB to 1 USD
        if chineseSwitch {
            chineseAmountNum = (Double(usdEntered)! * 6.82)
            chineseAmount = String(format: "%.0f", chineseAmountNum)
            return chineseAmount
        } else {
            chineseAmount = "N/A"
            return chineseAmount
        }
    }
        
    mutating func invalidNumber(_ value: String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Must be Integer Only"
        }
        return nil
    }
    
}
