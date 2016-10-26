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
    
    func buttonTapped() {
        
        
    }
    
    func buttonExited() {
        
        
    }
}







