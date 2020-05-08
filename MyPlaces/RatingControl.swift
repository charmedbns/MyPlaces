//
//  RatingView.swift
//  MyPlaces
//
//  Created by Лёпа on 08.05.2020.
//  Copyright © 2020 Lepa. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    
    private var ratingButton = [UIButton]()
    var rating = 0
    @IBInspectable var starSize: CGSize = CGSize(width: 44, height: 44) {
        didSet {
            setupButton()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButton()
        }
    }
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    // MARK: Button Action
    
    @objc func ratingButtonTapped(_ button: UIButton) {
        print("Button pressed 🥰")
    }
    
    // MARK: Private Methods
    
    private func setupButton() {
        for button in ratingButton {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButton.removeAll()
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            button.backgroundColor = .red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup button action
            button.addTarget(self, action: #selector(ratingButtonTapped(_:)), for: .touchUpInside)
            
            // Add the button to the stackView
            addArrangedSubview(button)
            
            // Add the new button on the rating button array
            ratingButton.append(button)
        }
    }
}
