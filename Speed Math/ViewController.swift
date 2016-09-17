//
//  ViewController.swift
//  Speed Math
//
//  Created by Joe Lucero on 9/15/16.
//  Copyright © 2016 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var directionsLabel: UILabel!
    @IBOutlet weak var equationToSolveLabel: UILabel!
    
    var maxNumberComputation = 10
    
    var computationName = "adding"
    var computationSymbol = "+"
    var computationCodeInt = 0
    
    var firstNumberInEquation = 0
    var secondNumberInEquation = 0
    var thirdNumberInEquation = 0
    var fourAnswerChoices: [Int] = [0,0,0,0]

    // View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateDirectionsLabel()
    }

    // IBActions
    @IBAction func sliderMoved(sender: UISlider) {
        maxNumberComputation = Int(sender.value)
        updateDirectionsLabel()
    }
    @IBAction func computationButtonSelected(sender: UISegmentedControl) {
        computationCodeInt = sender.selectedSegmentIndex
        
        
        if computationCodeInt == 0 {
            computationName = "adding"
            computationSymbol = "+"
        }
        else if computationCodeInt == 1 {
            computationName = "subtracting by"
            computationSymbol = "−"
        }
        else if computationCodeInt == 2 {
            computationName = "multiplying"
            computationSymbol = "×"
        }
        else if computationCodeInt == 3 {
            computationName = "dividing by"
            computationSymbol = "÷"
        }
        
        updateDirectionsLabel()
    }
    @IBAction func startNewGameButtonPressed(sender: UIButton) {
        // create a new equation and first, second, third numbers
        createNewEquation()
        equationToSolveLabel.text = "\(firstNumberInEquation) \(computationSymbol) \(secondNumberInEquation) = \(thirdNumberInEquation)"
        
        createAnArrayWithFourAnswerChoices()
        
        // flip all labels and buttons
        flipAllLabelsAndButtonsInGame()
    }

    // Custom Functions
    func updateDirectionsLabel () {

        
        directionsLabel.text = "You'll be \(computationName) numbers between 1-\(maxNumberComputation)"
    }
    func flipAllLabelsAndButtonsInGame() {
        for largeTag in 99...104 {
            if let button = self.view.viewWithTag(largeTag) {
                button.hidden = !button.hidden
            }
        }
    }
    func createNewEquation () {
        if computationCodeInt == 0 {
            // addition
            firstNumberInEquation = Int(arc4random_uniform(UInt32(maxNumberComputation)) + 1)
            secondNumberInEquation = Int(arc4random_uniform(UInt32(maxNumberComputation)) + 1)
            thirdNumberInEquation = firstNumberInEquation + secondNumberInEquation
            print("\(firstNumberInEquation) + \(secondNumberInEquation) = \(thirdNumberInEquation)")
            
        }
        
        else if computationCodeInt == 1 {
            // subtraction
            secondNumberInEquation = Int(arc4random_uniform(UInt32(maxNumberComputation)) + 1)
            thirdNumberInEquation = Int(arc4random_uniform(UInt32(maxNumberComputation)) + 1)
            firstNumberInEquation = secondNumberInEquation + thirdNumberInEquation
            print("\(firstNumberInEquation) - \(secondNumberInEquation) = \(thirdNumberInEquation)")
            
        }
        
        else if computationCodeInt == 2 {
            // multiplication
            firstNumberInEquation = Int(arc4random_uniform(UInt32(maxNumberComputation)) + 1)
            secondNumberInEquation = Int(arc4random_uniform(UInt32(maxNumberComputation)) + 1)
            thirdNumberInEquation = firstNumberInEquation * secondNumberInEquation
            print("\(firstNumberInEquation) × \(secondNumberInEquation) = \(thirdNumberInEquation)")
            
        }
        
        else if computationCodeInt == 3 {
            // division
            secondNumberInEquation = Int(arc4random_uniform(UInt32(maxNumberComputation)) + 1)
            thirdNumberInEquation = Int(arc4random_uniform(UInt32(maxNumberComputation)) + 1)
            firstNumberInEquation = secondNumberInEquation * thirdNumberInEquation
            print("\(firstNumberInEquation) ÷ \(secondNumberInEquation) = \(thirdNumberInEquation)")
            
        }
    }
    func createAnArrayWithFourAnswerChoices() {
        
    }


}

