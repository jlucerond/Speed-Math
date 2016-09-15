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
    
    var maxNumberComputation = 10
    var computationName = "adding"
    var computationCodeInt = 0

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
        }
        else if computationCodeInt == 1 {
            computationName = "subtracting"
        }
        else if computationCodeInt == 2 {
            computationName = "multiplying"
        }
        else if computationCodeInt == 3 {
            computationName = "dividing"
        }
        
        updateDirectionsLabel()
    }
    @IBAction func startNewGameButtonPressed(sender: UIButton) {
    }

    // Custom Functions
    func updateDirectionsLabel () {

        
        directionsLabel.text = "You'll be \(computationName) numbers between 1-\(maxNumberComputation)"
    }

}

