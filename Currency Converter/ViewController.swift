//
//  ViewController.swift
//  Currency Converter
//
//  Created by Edwin Cloud on 8/18/18.
//  Copyright © 2018 Edwin Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    @IBAction func group1(_ sender: UIButton) {
        usdInput.textColor = UIColor.red
        euroInput.textColor = UIColor.black
        group1.layer.backgroundColor = UIColor(named: "highlightColorCC")?.cgColor
        group2.layer.backgroundColor = UIColor.clear.cgColor
        usdActive = true
        usdInput.text = "0"
        euroInput.text = "0"
    }
    
    @IBAction func group2(_ sender: UIButton) {
        euroInput.textColor = UIColor.red
        usdInput.textColor = UIColor.black
        group2.layer.backgroundColor = UIColor(named: "highlightColorCC")?.cgColor
        group1.layer.backgroundColor = UIColor.clear.cgColor
        usdActive = false
        usdInput.text = "0"
        euroInput.text = "0"
    }
    
    @IBAction func button1(_ sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        if usdActive {
            if button.titleLabel?.text == "C" {
                usdInput.text = "0"
            } else {
                if usdInput.text == "0" {
                    usdInput.text = ""
                    usdInput.text = (usdInput.text)! + (button.titleLabel?.text)!
                } else {
                    usdInput.text = (usdInput.text)! + (button.titleLabel?.text)!
                }
                euroInput.text = convert(value: usdInput.text)
            }
        } else {
            if button.titleLabel?.text == "C" {
                euroInput.text = "0"
            } else {
                if euroInput.text == "0" {
                    euroInput.text = ""
                    euroInput.text = (euroInput.text)! + (button.titleLabel?.text)!
                } else {
                    euroInput.text = (euroInput.text)! + (button.titleLabel?.text)!
                }
                usdInput.text = convert(value: euroInput.text)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyStack.isUserInteractionEnabled = false
        setTheme()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setTheme() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button4.layer.borderWidth = 1
        button5.layer.borderWidth = 1
        button6.layer.borderWidth = 1
        button7.layer.borderWidth = 1
        button8.layer.borderWidth = 1
        button9.layer.borderWidth = 1
        buttonDecimal.layer.borderWidth = 1
        button0.layer.borderWidth = 1
        buttonC.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button2.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button3.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button4.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button5.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button6.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button7.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button8.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button9.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        buttonDecimal.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        button0.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        buttonC.layer.borderColor = UIColor(named: "greyBorderCC")?.cgColor
        
        usdInput.textColor = UIColor.red
        euroInput.textColor = UIColor.black
        group1.layer.backgroundColor = UIColor(named: "highlightColorCC")?.cgColor
        group2.layer.backgroundColor = UIColor.clear.cgColor
        
    }
    
    func convert(value:String?) -> String{
        if let dValue = Double(value!) {
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

