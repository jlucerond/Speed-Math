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
    
    @IBOutlet var answerChoiceButtons: [UIButton]!
    
    var maxNumberComputation = 10
    
    var computationName = "adding"
    var computationSymbol = "+"
    var computationCodeInt = 0
    
    var firstNumberInEquation = 0
    var secondNumberInEquation = 0
    var thirdNumberInEquation = 0
    var fourAnswerChoices = [Int]()

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
        updateButtonsWithFourAnswerChoices()
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
        if computationCodeInt == 0 {
            // addition
            let correctAnswer = thirdNumberInEquation
            let firstTrapAnswer = thirdNumberInEquation + 1
            let secondTrapAnswer = thirdNumberInEquation + 2
            let thirdTrapAnswer = thirdNumberInEquation + 3
            let fourthTrapAnswer = thirdNumberInEquation - 1
            let fifthTrapAnswer = thirdNumberInEquation - 2
            let sixthTrapAnswer = thirdNumberInEquation - 3
            
            var nonrandomizedArray = [Int]()
            nonrandomizedArray.append(firstTrapAnswer)
            nonrandomizedArray.append(secondTrapAnswer)
            nonrandomizedArray.append(thirdTrapAnswer)
            nonrandomizedArray.append(fourthTrapAnswer)
            nonrandomizedArray.append(fifthTrapAnswer)
            nonrandomizedArray.append(sixthTrapAnswer)
            
            print("\(nonrandomizedArray)")

            var arrayOfNumbersToKeep = [Int]()
            
            for i in 0...nonrandomizedArray.count-1 {
                if nonrandomizedArray[i] > 1 {
                    arrayOfNumbersToKeep.append(nonrandomizedArray[i])
                }
            }
            
            print("\(arrayOfNumbersToKeep)")
            
            var randomizedArray = [Int]()

            for _ in 1...3 {
                let arrayCount = arrayOfNumbersToKeep.count
                let randomNumber = Int(arc4random_uniform(UInt32(arrayCount)))
                randomizedArray.append(arrayOfNumbersToKeep[randomNumber])
                arrayOfNumbersToKeep.removeAtIndex(randomNumber)
            }
            
            let randomPlacementNumber = Int(arc4random_uniform(3))
            randomizedArray.insert(correctAnswer, atIndex: randomPlacementNumber)
            
            fourAnswerChoices = randomizedArray

            print("\(randomizedArray)")
        }
        
        else if computationCodeInt == 1 {
            // subtraction
            let correctAnswer = thirdNumberInEquation
            let firstTrapAnswer = thirdNumberInEquation + 1
            let secondTrapAnswer = thirdNumberInEquation + 2
            let thirdTrapAnswer = thirdNumberInEquation + 3
            let fourthTrapAnswer = thirdNumberInEquation - 1
            let fifthTrapAnswer = thirdNumberInEquation - 2
            let sixthTrapAnswer = thirdNumberInEquation - 3
            
            var nonrandomizedArray = [Int]()
            nonrandomizedArray.append(firstTrapAnswer)
            nonrandomizedArray.append(secondTrapAnswer)
            nonrandomizedArray.append(thirdTrapAnswer)
            nonrandomizedArray.append(fourthTrapAnswer)
            nonrandomizedArray.append(fifthTrapAnswer)
            nonrandomizedArray.append(sixthTrapAnswer)
            
            print("\(nonrandomizedArray)")
            
            var arrayOfNumbersToKeep = [Int]()
            
            for i in 0...nonrandomizedArray.count-1 {
                if nonrandomizedArray[i] > 1 {
                    arrayOfNumbersToKeep.append(nonrandomizedArray[i])
                }
            }
            
            print("\(arrayOfNumbersToKeep)")
            
            var randomizedArray = [Int]()
            
            for _ in 1...3 {
                let arrayCount = arrayOfNumbersToKeep.count
                let randomNumber = Int(arc4random_uniform(UInt32(arrayCount)))
                randomizedArray.append(arrayOfNumbersToKeep[randomNumber])
                arrayOfNumbersToKeep.removeAtIndex(randomNumber)
            }
            
            let randomPlacementNumber = Int(arc4random_uniform(3))
            randomizedArray.insert(correctAnswer, atIndex: randomPlacementNumber)
            
            fourAnswerChoices = randomizedArray
            
            print("\(randomizedArray)")
        }
        
        else if computationCodeInt == 2 {
            // multiplication
            let correctAnswer = thirdNumberInEquation
            let firstTrapAnswer = thirdNumberInEquation + 1*(secondNumberInEquation)
            let secondTrapAnswer = thirdNumberInEquation + 2*(secondNumberInEquation)
            let thirdTrapAnswer = thirdNumberInEquation + 3*(secondNumberInEquation)
            let fourthTrapAnswer = thirdNumberInEquation - 1*(secondNumberInEquation)
            let fifthTrapAnswer = thirdNumberInEquation - 2*(secondNumberInEquation)
            let sixthTrapAnswer = thirdNumberInEquation - 3*(secondNumberInEquation)
            
            var nonrandomizedArray = [Int]()
            nonrandomizedArray.append(firstTrapAnswer)
            nonrandomizedArray.append(secondTrapAnswer)
            nonrandomizedArray.append(thirdTrapAnswer)
            nonrandomizedArray.append(fourthTrapAnswer)
            nonrandomizedArray.append(fifthTrapAnswer)
            nonrandomizedArray.append(sixthTrapAnswer)
            
            print("\(nonrandomizedArray)")
            
            var arrayOfNumbersToKeep = [Int]()
            
            for i in 0...nonrandomizedArray.count-1 {
                if nonrandomizedArray[i] > 1 {
                    arrayOfNumbersToKeep.append(nonrandomizedArray[i])
                }
            }
            
            print("\(arrayOfNumbersToKeep)")
            
            var randomizedArray = [Int]()
            
            for _ in 1...3 {
                let arrayCount = arrayOfNumbersToKeep.count
                let randomNumber = Int(arc4random_uniform(UInt32(arrayCount)))
                randomizedArray.append(arrayOfNumbersToKeep[randomNumber])
                arrayOfNumbersToKeep.removeAtIndex(randomNumber)
            }
            
            let randomPlacementNumber = Int(arc4random_uniform(3))
            randomizedArray.insert(correctAnswer, atIndex: randomPlacementNumber)
            
            fourAnswerChoices = randomizedArray

            print("\(randomizedArray)")
        }

        else if computationCodeInt == 3 {
            // division
            let correctAnswer = thirdNumberInEquation
            let firstTrapAnswer = thirdNumberInEquation + 1
            let secondTrapAnswer = thirdNumberInEquation + 2
            let thirdTrapAnswer = thirdNumberInEquation + 3
            let fourthTrapAnswer = thirdNumberInEquation - 1
            let fifthTrapAnswer = thirdNumberInEquation - 2
            let sixthTrapAnswer = thirdNumberInEquation - 3
            
            var nonrandomizedArray = [Int]()
            nonrandomizedArray.append(firstTrapAnswer)
            nonrandomizedArray.append(secondTrapAnswer)
            nonrandomizedArray.append(thirdTrapAnswer)
            nonrandomizedArray.append(fourthTrapAnswer)
            nonrandomizedArray.append(fifthTrapAnswer)
            nonrandomizedArray.append(sixthTrapAnswer)
            
            print("\(nonrandomizedArray)")
            
            var arrayOfNumbersToKeep = [Int]()
            
            for i in 0...nonrandomizedArray.count-1 {
                if nonrandomizedArray[i] > 1 {
                    arrayOfNumbersToKeep.append(nonrandomizedArray[i])
                }
            }
            
            print("\(arrayOfNumbersToKeep)")
            
            var randomizedArray = [Int]()
            
            for _ in 1...3 {
                let arrayCount = arrayOfNumbersToKeep.count
                let randomNumber = Int(arc4random_uniform(UInt32(arrayCount)))
                randomizedArray.append(arrayOfNumbersToKeep[randomNumber])
                arrayOfNumbersToKeep.removeAtIndex(randomNumber)
            }
            
            let randomPlacementNumber = Int(arc4random_uniform(3))
            randomizedArray.insert(correctAnswer, atIndex: randomPlacementNumber)
            
            fourAnswerChoices = randomizedArray
            print("\(randomizedArray)")
        }

    }
    func updateButtonsWithFourAnswerChoices() {
        for button in answerChoiceButtons {
            if button.tag == 101 {
                button.setTitle("yes", forState: .Normal)
            }
            
            else if button.tag == 102 {
                
            }
            
            else if button.tag == 103 {
                
            }
            
            else if button.tag == 104 {
                
            }
        }
    }
}

