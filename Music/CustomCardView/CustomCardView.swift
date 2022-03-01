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
    
    lazy var cardImageView: UIImageView = {
        let cardImageView = UIImageView()
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.backgroundColor = .black
        return cardImageView
    }()
    
    lazy var overlayView: UIView = {
        let overlayView = UIView()
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return overlayView
    }()
    
    lazy var profileBorderView: UIView = {
        let profileBorderView = UIView()
        profileBorderView.translatesAutoresizingMaskIntoConstraints = false
        profileBorderView.backgroundColor = .clear
        profileBorderView.layer.borderWidth = 1
        profileBorderView.layer.borderColor = UIColor.white.cgColor
        profileBorderView.layer.cornerRadius = 25
        return profileBorderView
    }()
    
    lazy var cardProfileImageView: UIImageView = {
        let cardProfileImageView = UIImageView()
        cardProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        cardProfileImageView.contentMode = .scaleAspectFill
        cardProfileImageView.backgroundColor = .black
        cardProfileImageView.clipsToBounds = true
        cardProfileImageView.layer.cornerRadius = 20
        return cardProfileImageView
    }()
    
    lazy var addProfileImageButton: UIButton = {
        let addProfileImageButton = UIButton()
        addProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        addProfileImageButton.backgroundColor = .white
        addProfileImageButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        addProfileImageButton.layer.cornerRadius = 10
        return addProfileImageButton
    }()

}
