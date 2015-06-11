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
        display.text = "clicked : \(numberMaps(sender.tag))"
    }
    @IBAction func equalPressed(sender: AnyObject) {
           display.text = "the answer is A"
    }
    
    @IBAction func cleanUp(sender: AnyObject) {
        display.text = "0"
    }
    @IBAction func reverseSign(sender: AnyObject) {
    }
    
    @IBAction func operatorSelect(sender: UIButton) {
        display.text = "clicked operator: \(operatorMaps(sender.tag))"
    }
    
    func numberMaps(tag: Int) -> Int {
        return tag
    }

    func operatorMaps(tag: Int) -> Int {
        return tag
    }
    
}

