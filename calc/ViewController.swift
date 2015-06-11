//
//  ViewController.swift
//  calc
//
//  Created by kpse on 6/11/15.
//  Copyright (c) 2015 kpse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var currentStatement: ((a2: Statement) -> Statement)?
    var continuousInputing = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func percentPress(sender: AnyObject) {
        continuousInputing = false
        currentStatement = nil
        let s = (display.text! as NSString).doubleValue / 100
        display.text = reviseDisplay("\(s)")
    }
    
    
    @IBAction func dotPress(sender: AnyObject) {
        if let value = display.text {
            if value.rangeOfString(".") != nil {
                display.text = value
            } else {
                display.text = "\(value)."
            }
        }
    }
    
    @IBAction func numberPress(sender: UIButton) {
        if continuousInputing {
            display.text = appendNumber("\(numberMaps(sender.tag))", old: display.text)
        } else {
            display.text = "\(numberMaps(sender.tag))"
            continuousInputing = true
        }
        
    }
    @IBAction func equalPressed(sender: AnyObject) {
        let arg2 = StatementFactory.create(display.text)
        if let statement = currentStatement {
            display.text = reviseDisplay("\(statement(a2: arg2).eval())")
        }
        
    }
    
    @IBAction func cleanUp(sender: AnyObject) {
        display.text = "0"
        currentStatement = nil
    }
    @IBAction func reverseSign(sender: AnyObject) {
        if let value = display.text {
            if value.rangeOfString("-") != nil {
                display.text = value.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            } else {
                display.text = "-\(value)"
            }
        }

    }
    
    @IBAction func operatorSelect(sender: UIButton) {
        let arg1 = StatementFactory.create(display.text)
        let op = OperatorFactory.create(sender.tag)
        if let statement = currentStatement {
            currentStatement = ComplexStatement.curry(statement(a2:arg1), op:op)
        } else {
            currentStatement = ComplexStatement.curry(arg1, op:op)
            
        }
        continuousInputing = false
        
    }
    
    func numberMaps(tag: Int) -> Int {
        return tag
    }
    
    func reviseDisplay(input: String) -> String {
        let simple = simplifyDouble(input)
        return simple
    }
    
    func simplifyDouble(input: String) -> String {
        var ierror: NSError?
        var regex:NSRegularExpression = NSRegularExpression(pattern: "\\.0$", options: NSRegularExpressionOptions.CaseInsensitive, error: &ierror)!
        return regex.stringByReplacingMatchesInString(input, options: nil, range: NSMakeRange(0, count(input)), withTemplate: "")
    }
    
    
    
    func appendNumber(newChar: String, old: String?) -> String {
        if let s = old {
            if count(s) >= 14 {
                return s
            }
            if s == "0" {
                return newChar
            }
            return "\(s)\(newChar)"
        }
        return newChar
        
    }
    
}

