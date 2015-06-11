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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func dotPress(sender: AnyObject) {
    }
    
    @IBAction func numberPress(sender: UIButton) {
        display.text = "\(numberMaps(sender.tag))"
    }
    @IBAction func equalPressed(sender: AnyObject) {
        let arg2 = StatementFactory.create(display.text)
        if let statement = currentStatement {
            display.text = "\(statement(a2: arg2).eval())"
        }
        
    }
    
    @IBAction func cleanUp(sender: AnyObject) {
        display.text = "0"
        currentStatement = nil
    }
    @IBAction func reverseSign(sender: AnyObject) {
    }
    
    @IBAction func operatorSelect(sender: UIButton) {
        let arg1 = StatementFactory.create(display.text)
        let op = OperatorFactory.create(sender.tag)
        currentStatement = ComplexStatement.curry(arg1, op:op)
        
    }
    
    func numberMaps(tag: Int) -> Int {
        return tag
    }
    
}

