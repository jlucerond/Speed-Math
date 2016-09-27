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
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var computationSegments: UISegmentedControl!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    var maxNumberComputation = 10
    
    var computationName = "adding"
    var computationSymbol = "+"
    var computationCodeInt = 0
    
    var firstNumberInEquation = 0
    var secondNumberInEquation = 0
    var thirdNumberInEquation = 0
    var fourAnswerChoices = [Int]()
    
    var round = 0
    var score = 0
    var highScore = 0
    
    var timer = Timer()
    var counter = 10.0

    // View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        I'd eventually like to come back and fix this. I need to learn how to resize UIImages
//        let thumbnailImage = UIImage(named: "addition")
//        slider.setThumbImage(thumbnailImage, forState: .Normal)
        
        updateDirectionsLabel()
    }

    // IBActions
    @IBAction func sliderMoved(_ sender: UISlider) {
        maxNumberComputation = Int(sender.value)
        updateDirectionsLabel()
    }
    @IBAction func computationButtonSelected(_ sender: UISegmentedControl) {
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
    @IBAction func startNewGameButtonPressed(_ sender: UIButton) {
        
        round = 1
        roundLabel.text = "\(round)"
        
        score = 0
        scoreLabel.text = "\(score)"
        
        createNewEquation()
        flipAllLabelsAndButtonsInGame()
        
        counter = 10.0
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timerShouldRun), userInfo: nil, repeats: true)
    }
    @IBAction func answerChoiceButtonWasPressed (_ sender: UIButton) {
        // check to see if answer is right
        let answerSelected = sender.titleLabel?.text
        
        let numberOfAnswer = Int(answerSelected!)
        
        // if right, then do a new equation

        if numberOfAnswer == thirdNumberInEquation {
            print("correct!")
            answeredTheQuestionCorrectly()
        }
            
        // else wrong, then show alert
        else {
            answeredTheQuestionWrong()
        }
    }

    // Custom Functions
    func updateDirectionsLabel () {

        
        directionsLabel.text = "You'll be \(computationName) numbers between 1-\(maxNumberComputation)"
    }
    func flipAllLabelsAndButtonsInGame() {
        for largeTag in 99...104 {
            if let button = self.view.viewWithTag(largeTag) {
                button.isHidden = !button.isHidden
            }
        }
        
        slider.isEnabled = !slider.isEnabled
        computationSegments.isEnabled = !computationSegments.isEnabled
        
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
        
        // then do all the updating of stuff
        equationToSolveLabel.text = "\(firstNumberInEquation) \(computationSymbol) \(secondNumberInEquation) ="
        createAnArrayWithFourAnswerChoices()
        updateButtonsWithFourAnswerChoices()
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
                arrayOfNumbersToKeep.remove(at: randomNumber)
            }
            
            let randomPlacementNumber = Int(arc4random_uniform(4))
            randomizedArray.insert(correctAnswer, at: randomPlacementNumber)
            
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
                arrayOfNumbersToKeep.remove(at: randomNumber)
            }
            
            let randomPlacementNumber = Int(arc4random_uniform(4))
            randomizedArray.insert(correctAnswer, at: randomPlacementNumber)
            
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
                arrayOfNumbersToKeep.remove(at: randomNumber)
            }
            
            let randomPlacementNumber = Int(arc4random_uniform(4))
            randomizedArray.insert(correctAnswer, at: randomPlacementNumber)
            
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
                arrayOfNumbersToKeep.remove(at: randomNumber)
            }
            
            let randomPlacementNumber = Int(arc4random_uniform(4))
            randomizedArray.insert(correctAnswer, at: randomPlacementNumber)
            
            fourAnswerChoices = randomizedArray
            print("\(randomizedArray)")
        }

    }
    func updateButtonsWithFourAnswerChoices() {
        for button in answerChoiceButtons {
            if button.tag == 101 {
                let answerChoiceOne = fourAnswerChoices[0]
                button.setTitle("\(answerChoiceOne)", for: UIControlState())
            }
            
            else if button.tag == 102 {
                let answerChoiceTwo = fourAnswerChoices[1]
                button.setTitle("\(answerChoiceTwo)", for: UIControlState())
            }
            
            else if button.tag == 103 {
                let answerChoiceThree = fourAnswerChoices[2]
                button.setTitle("\(answerChoiceThree)", for: UIControlState())
            }
            
            else if button.tag == 104 {
                let answerChoiceFour = fourAnswerChoices[3]
                button.setTitle("\(answerChoiceFour)", for: UIControlState())
            }
        }
    }
    func answeredTheQuestionCorrectly() {
        // update the time
        timer.invalidate()
        counter = 10.0 - Double(round)/10
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timerShouldRun), userInfo: nil, repeats: true)
        
        // update the round
        round += 1
        roundLabel.text = "\(round)"
        
        // update the score
        score += 1
        scoreLabel.text = "\(score)"
        
        // update the high score
        if score > highScore {
            highScore = score
            highScoreLabel.text = "\(highScore)"
        }
        
        createNewEquation()
    }
    func answeredTheQuestionWrong() {
        timer.invalidate()
        
        let alert = UIAlertController(title: "Incorrect", message: "\(firstNumberInEquation) \(computationSymbol) \(secondNumberInEquation) = \(thirdNumberInEquation)", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: {action in self.flipAllLabelsAndButtonsInGame()})
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func timerShouldRun() {
        counter -= 0.1
        
        if counter <= 0 {
            timer.invalidate()
            
            let alert = UIAlertController(title: "Time's Up!", message: "\(firstNumberInEquation) \(computationSymbol) \(secondNumberInEquation) = \(thirdNumberInEquation)", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default, handler: {action in self.flipAllLabelsAndButtonsInGame()})
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        else {
            timeLabel.text = String(format: "%.1f", counter)
        }
    }
    
}

