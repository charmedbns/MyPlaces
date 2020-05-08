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
    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
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
        guard let index = ratingButton.firstIndex(of: button) else { return }
        
        // Calculate the rating og the selected button
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    // MARK: Private Methods
    
    private func setupButton() {
        for button in ratingButton {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButton.removeAll()
        
        // Load button image
        let filledStarImageConfiguration = UIImage.SymbolConfiguration(pointSize: 44, weight: .light)
        var filledStar = UIImage(systemName: "star.fill", withConfiguration: filledStarImageConfiguration)
        let emptyStarImageConfiguration = UIImage.SymbolConfiguration(pointSize: 44, weight: .light)
        var emptyStar = UIImage(systemName: "star", withConfiguration: emptyStarImageConfiguration)
        let highlightedStarImageConfiguration = UIImage.SymbolConfiguration(pointSize: 44, weight: .light)
        var highlightedStar = UIImage(systemName: "star.fill", withConfiguration: highlightedStarImageConfiguration)
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            
            // Set the button image
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            button.tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            
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
        updateButtonSelectionState()
    }
    
    private func updateButtonSelectionState() {
        for (index, button) in ratingButton.enumerated() {
            button.isSelected = index < rating
        }
    }
}
