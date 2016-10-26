//
//  ViewController.swift
//  ProgrammaticConstraintsWithAnimation
//
//  Created by Jeff Norton on 10/26/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //==================================================
    // MARK: - Properties
    //==================================================
    
    let topLeftButton = UIButton()
    let topRightButton = UIButton()
    let bottomLeftButton = UIButton()
    let bottomRightButton = UIButton()
    
    //==================================================
    // MARK: - General
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupConstraints()
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================

    func setupButtons() {
        
        // Set colors
        
        topLeftButton.backgroundColor = .green
        topRightButton.backgroundColor = .yellow
        bottomLeftButton.backgroundColor = .blue
        bottomRightButton.backgroundColor = .red
        
        // Add targets to buttons for color animation
        
        topLeftButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        topRightButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        bottomLeftButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        bottomRightButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Add targets to buttons for shake animation
        
        topLeftButton.addTarget(self, action: #selector(ViewController.buttonExited), for: .touchDragExit)
        topRightButton.addTarget(self, action: #selector(ViewController.buttonExited), for: .touchDragExit)
        bottomLeftButton.addTarget(self, action: #selector(ViewController.buttonExited), for: .touchDragExit)
        bottomRightButton.addTarget(self, action: #selector(ViewController.buttonExited), for: .touchDragExit)
        
        // Add buttons as a subview of the view
        
        view.addSubview(topLeftButton)
        view.addSubview(topRightButton)
        view.addSubview(bottomLeftButton)
        view.addSubview(bottomRightButton)
    }
    
    func setupConstraints() {
        
        // Turn off translatesAutoresizingMaskIntoConstraints
        
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
        bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Height and width constraints
        
        let topButtonWidths = NSLayoutConstraint(item: topLeftButton, attribute: .width, relatedBy: .equal, toItem: topRightButton, attribute: .width, multiplier: 1.0, constant: 0)
        let topButtonHeights = NSLayoutConstraint(item: topLeftButton, attribute: .height, relatedBy: .equal, toItem: topRightButton, attribute: .height, multiplier: 1.0, constant: 0)
        let bottomButtonWidths = NSLayoutConstraint(item: bottomLeftButton, attribute: .width, relatedBy: .equal, toItem: bottomRightButton, attribute: .width, multiplier: 1.0, constant: 0)
        let rightButtonHeights = NSLayoutConstraint(item: bottomRightButton, attribute: .height, relatedBy: .equal, toItem: topRightButton, attribute: .height, multiplier: 1.0, constant: 0)
        
        // Add height and width constraints to view
        
        view.addConstraints([topButtonWidths, topButtonHeights, bottomButtonWidths, rightButtonHeights])
        
        // Green top and leading constraints
        
        let greenLeadingConstraints = NSLayoutConstraint(item: topLeftButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let greenTopConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        
        // Green trailing to yellow leading constraint
        
        let greenToYellowConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .trailing, relatedBy: .equal, toItem: topRightButton, attribute: .leading, multiplier: 1.0, constant: 0)
        
        // Green bottom to blue top constraint
        
        let greenToBlueConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .bottom, relatedBy: .equal, toItem: bottomLeftButton, attribute: .top, multiplier: 1.0, constant: 0)
        
        // Yellow top and trailing constraints
        
        let yellowTopConstraint = NSLayoutConstraint(item: topRightButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let yellowTrailingConstraint = NSLayoutConstraint(item: topRightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        // Blue leading and bottom constraints
        
        let blueLeadingConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let blueBottomConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        // Blue trailing to red leading constraint
        
        let blueToRedConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .trailing, relatedBy: .equal, toItem: bottomRightButton, attribute: .leading, multiplier: 1.0, constant: 0)
        
        // Yellow bottom to red top constraint
        
        let yellowToRedConstraint = NSLayoutConstraint(item: topRightButton, attribute: .bottom, relatedBy: .equal, toItem: bottomRightButton, attribute: .top, multiplier: 1.0, constant: 0)
        
        // Red bottom and trailing constraints
        
        let redBottomConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let redTrailingConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        // Add constraints to view
        
        view.addConstraints([greenLeadingConstraints,
            greenTopConstraint, greenToYellowConstraint, greenToBlueConstraint, yellowTopConstraint, yellowTrailingConstraint, blueLeadingConstraint, blueBottomConstraint, blueToRedConstraint, yellowToRedConstraint, redBottomConstraint, redTrailingConstraint])
    }
    
    func buttonTapped() {
        
        // Make a variable for each color
        
        let topLeftColor = topLeftButton.backgroundColor
        let topRightColor = topRightButton.backgroundColor
        let bottomLeftColor = bottomLeftButton.backgroundColor
        let bottomRightColor = bottomRightButton.backgroundColor
        
        // Animate the buttons' background colors
        
        UIView.animate(withDuration: 1.0) { 
            
            self.topLeftButton.backgroundColor = bottomLeftColor
            self.topRightButton.backgroundColor = topLeftColor
            self.bottomRightButton.backgroundColor = topRightColor
            self.bottomLeftButton.backgroundColor = bottomRightColor
        }
    }
    
    func buttonExited(_ sender: UIButton) {
        
        let position1 = sender.frame.origin.x + sender.frame.width / 2
        let position2 = sender.frame.origin.x + sender.frame.width / 2 - 15
        let position3 = sender.frame.origin.x + sender.frame.width / 2
        let position4 = sender.frame.origin.x + sender.frame.width / 2 + 15
        let position5 = sender.frame.origin.x + sender.frame.width / 2
        
        view.bringSubview(toFront: sender)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [position1, position2, position3, position4, position5]
        
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 0.5
        animation.repeatCount = 5.0
        
        sender.layer.add(animation, forKey: "shake")
    }
}







