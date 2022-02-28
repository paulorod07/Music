//
//  CustomCardView.swift
//  Music
//
//  Created by Paulo Rodrigues on 28/02/22.
//

import UIKit

enum ViewMode {
    case full
    case card
}

class CustomCardView: UIView {
    
    // MARK: - Properties

    var viewMode: ViewMode?
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTopConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?
    var dataModel: CardViewModel?
    
    // MARK: - View setup
    
    lazy var cardContainerView: UIView = {
        let cardContainerView = UIView()
        cardContainerView.translatesAutoresizingMaskIntoConstraints = false
        cardContainerView.layer.cornerRadius = 30
        cardContainerView.clipsToBounds = true
        cardContainerView.layer.shadowOpacity = 1
        cardContainerView.layer.shadowOffset = CGSize(width: 0, height: -2)
        cardContainerView.layer.shadowRadius = 20
        return cardContainerView
    }()

}
