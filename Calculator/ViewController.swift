//
//  ViewController.swift
//  Calculator
//
//  Created by Austin Borop on 12/10/17.
//  Copyright © 2017 Austin Borop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Int = 0;
    var previousNumber:Int = 0;
    var performingCalculation = false;
    var operation = 0;
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func operators(_ sender: UIButton) {
        if label.text != ""{
            previousNumber = Int(label.text!)!
            label.text = "";
            switch sender.tag {
            case 12: label.text = "÷"; //Division
            case 13: label.text = "x"; //Multiplication
            case 14: label.text = "-"; //Subtraction
            case 15: label.text = "+"; //Addition
            default : break
            }
            operation = sender.tag
            performingCalculation = true;
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        label.text = ""
        previousNumber = 0;
        numberOnScreen = 0;
        operation = 0;
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        
        switch operation{
            
        case 12: label.text = String(previousNumber / numberOnScreen) //Division
        case 13: label.text = String(previousNumber * numberOnScreen) //Multiplication
        case 14: label.text = String(previousNumber - numberOnScreen) //Subtraction
        case 15: label.text = String(previousNumber + numberOnScreen) //Addition
        default:
            break
    }
}
    @IBAction func numbers(_ sender: UIButton) {
        let test = Int(label.text!)
        if test == nil{ //Test if it's an integer
            label.text = "" //If it's not an integer set it to blank
        }
        if performingCalculation == true{
            label.text = label.text! + String(sender.tag-1) //tag ID minus 1
            numberOnScreen = Int(label.text!)!
            performingCalculation = false
        }
        else{
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Int(label.text!)!
        }
        }
    }
