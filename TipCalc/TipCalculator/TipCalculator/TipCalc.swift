//
//  TipCalc.swift
//  TipCalculator
//
//  Created by Mac on 8/6/16.
//  Copyright © 2016 ElenaSidyakina. All rights reserved.
//

import Foundation



class TipCalc {

    private var _billAmount = 0.0
    private var _tipPercent = 0.0
    private var _tipAmount = 0.0
    private var _totalAmount = 0.0
    private var _splitBy = 0.0
    private var _eachAmount = 0.0
    
    var billAmount: Double {
        get{
           return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    
    var splitBy: Double {
        get {
            return _splitBy
        } set {
            _splitBy = newValue
        }
    }
    
    
    var eachAmount: Double {
        get {
            return _eachAmount
        } set {
            _eachAmount = newValue
        }
    }
    
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        get {
            return _totalAmount
        } set {
            _totalAmount = newValue
        }
    }
    //Initialize private variables that will be updated by the user
    init(billAmount: Double, tipPercent: Double) {
        
    //Take the private variables and update them with billAmout and tipPercent
        self._billAmount = billAmount
        self._tipPercent = tipPercent
    }
    
    init(eachAmount: Double, splitBy: Double) {
        self._eachAmount = eachAmount
        self._splitBy = splitBy
    }
    
    func calculateTip() {
        _tipAmount = tipPercent * billAmount
        _totalAmount = tipAmount + billAmount
        _eachAmount = _totalAmount / _splitBy
    }
    
    func calculateEach() {
        _eachAmount = totalAmount / splitBy
    }
  
    
    
}
