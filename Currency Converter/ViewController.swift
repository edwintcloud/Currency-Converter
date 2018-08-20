//
//  ViewController.swift
//  Currency Converter
//
//  Created by Edwin Cloud on 8/18/18.
//  Copyright © 2018 Edwin Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Global Variables
    var usdValue: Double = 0.00
    var euroValue: Double = 0.00
    var usdActive:Bool = true
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var usdInput: UILabel!
    @IBOutlet weak var euroInput: UILabel!
    @IBOutlet weak var currencyStack: UIStackView!
    @IBOutlet weak var group1: UIButton!
    @IBOutlet weak var group2: UIButton!
    
    // USD group background button - onTap event handler
    @IBAction func group1(_ sender: UIButton) {
        usdInput.textColor = UIColor.red
        euroInput.textColor = UIColor.black
        group1.layer.backgroundColor = UIColor(named: "highlightColorCC")?.cgColor
        group2.layer.backgroundColor = UIColor.clear.cgColor
        usdActive = true
        usdInput.text = "0"
        euroInput.text = "0"
    }
    
    // Euro group background button - onTap event handler
    @IBAction func group2(_ sender: UIButton) {
        euroInput.textColor = UIColor.red
        usdInput.textColor = UIColor.black
        group2.layer.backgroundColor = UIColor(named: "highlightColorCC")?.cgColor
        group1.layer.backgroundColor = UIColor.clear.cgColor
        usdActive = false
        usdInput.text = "0"
        euroInput.text = "0"
    }
    
    // onTap event handler for NumberPad buttons
    @IBAction func button1(_ sender: AnyObject) {
        
        // Set button var = sender as UIButton or exit safely
        guard let button = sender as? UIButton else {
            return
        }
        
        // If C button, clear reset inputs to "0"
        if button.titleLabel?.text == "C" {
            usdInput.text = "0"
            euroInput.text = "0"
            return
        }
        
        // USD group active actions
        if usdActive {
            
            // If decimal button, make sure only one decimal point exists otherwise return
            if button.titleLabel?.text == "." {
                if usdInput.text!.contains(".") { return }
            }
            
            if usdInput.text == "0" {
                usdInput.text = ""
                usdInput.text = (usdInput.text)! + (button.titleLabel?.text)!
            } else {
                usdInput.text = (usdInput.text)! + (button.titleLabel?.text)!
            }
            euroInput.text = convert(value: usdInput.text)
        }
        
        // Euro group active actions
        else {
            
            // If decimal button, make sure only one decimal point exists otherwise return
            if button.titleLabel?.text == "." {
                if euroInput.text!.contains(".") { return }
            }
            
            if euroInput.text == "0" {
                euroInput.text = ""
                euroInput.text = (euroInput.text)! + (button.titleLabel?.text)!
            } else {
                euroInput.text = (euroInput.text)! + (button.titleLabel?.text)!
            }
            usdInput.text = convert(value: euroInput.text)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable user interaction needed to detect group button click - makes currencyStack a passthrough view
        currencyStack.isUserInteractionEnabled = false
        
        // set the initial theme
        setTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setTheme() {
        
        // Set border on buttons
        let buttons = [button1,button2,button3,button4,button5,button6,button6,button7,button8,button9,buttonDecimal,button0,buttonC]
        for button in buttons {
            button?.layer.borderWidth = 1
            button?.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        }
        
        // Set initial text colors and groups background color
        usdInput.textColor = UIColor.red
        euroInput.textColor = UIColor.black
        group1.layer.backgroundColor = UIColor(named: "highlightColorCC")?.cgColor
        group2.layer.backgroundColor = UIColor.clear.cgColor
        
    }
    
    func convert(value:String?) -> String{
        
        // Convert string to Double and if successful store in dValue else return "0"
        if let dValue = Double(value!) {
            
            // Check if result is 0 and return 0 instead of 0.00
            if dValue == 0.00 { return "0" }
            
            // Check global bool usdActive to determine which group is selected to return correct result
            if usdActive {
                return String(format: "%.2f", dValue * 0.87)
            } else {
                return String(format: "%.2f", dValue / 0.87)
            }
            
        } else {
            return "0"
        }
        
    }

}

