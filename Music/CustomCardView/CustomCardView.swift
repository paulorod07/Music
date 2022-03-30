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
    var cardViewModel: CardViewModel?
    
    // MARK: - Views
    
    lazy var cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 20
        return view
    }()
    
    lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        return imageView
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return view
    }()
    
    lazy var profileBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var cardProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    lazy var addProfileImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var cardCategoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var cardCategoryDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    lazy var cardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 31, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var likeAndTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Setup
    
    func setupView(data: CardViewModel) {
        cardCategoryTitleLabel.text = data.categoryName
        cardCategoryDateLabel.text = data.categoryDate
        cardTitleLabel.text = data.cardTitle
        likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        descriptionTitleLabel.text = data.cardDescription
        cardImageView.image = UIImage(named: data.cardImage ?? "")
        cardProfileImageView.image = UIImage(named: data.categoryImage ?? "")
    }
    
    init(viewMode: ViewMode, cardViewModel: CardViewModel) {
        let frame: CGRect = CGRect.zero
        super.init(frame: frame)
        self.viewMode = viewMode
        self.cardViewModel = cardViewModel
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubview
    
    private func addSubview() {
        addSubview(cardContainerView)
        cardContainerView.addSubview(cardImageView)
        cardContainerView.addSubview(overlayView)
        cardContainerView.addSubview(profileBorderView)
        cardContainerView.addSubview(cardProfileImageView)
        cardContainerView.addSubview(addProfileImageButton)
        cardContainerView.addSubview(cardCategoryTitleLabel)
        cardContainerView.addSubview(cardCategoryDateLabel)
        cardContainerView.addSubview(cardTitleLabel)
        cardContainerView.addSubview(likeAndTimeLabel)
        cardContainerView.addSubview(descriptionTitleLabel)
        updateLayout(for: viewMode ?? .card)
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        containerLeadingConstraints?.isActive = true
        
        containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 15)
        containerTopConstraints?.isActive = true
        
        containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        containerBottomConstraints?.isActive = true
        
        containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        containerTrailingConstraints?.isActive = true
        
        overlayView.pin(to: cardContainerView)
        cardImageView.pin(to: cardContainerView)
        
        NSLayoutConstraint.activate([
            profileBorderView.topAnchor.constraint(equalTo: cardContainerView.topAnchor, constant: 60),
            profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            profileBorderView.heightAnchor.constraint(equalToConstant: 50),
            
            addProfileImageButton.trailingAnchor.constraint(equalTo: profileBorderView.trailingAnchor, constant: 4),
            addProfileImageButton.bottomAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 4),
            addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            cardProfileImageView.centerXAnchor.constraint(equalTo: profileBorderView.centerXAnchor),
            cardProfileImageView.centerYAnchor.constraint(equalTo: profileBorderView.centerYAnchor),
            cardProfileImageView.widthAnchor.constraint(equalToConstant: 40),
            cardProfileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            cardCategoryTitleLabel.topAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 10),
            cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardCategoryDateLabel.topAnchor.constraint(equalTo: cardCategoryTitleLabel.bottomAnchor, constant: 2),
            cardCategoryDateLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardTitleLabel.topAnchor.constraint(equalTo: cardCategoryDateLabel.bottomAnchor, constant: 20),
            cardTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            cardTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),
            
            likeAndTimeLabel.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor, constant: 10),
            likeAndTimeLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: likeAndTimeLabel.bottomAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 40),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -40)
        ])
    }
    
    private func updateLayout(for mode: ViewMode) {
        switch mode {
        case .full:
            containerLeadingConstraints?.constant = 0
            containerTopConstraints?.constant = 0
            containerTrailingConstraints?.constant = 0
            containerBottomConstraints?.constant = 0
            descriptionTitleLabel.isHidden = false
        case .card:
            containerLeadingConstraints?.constant = 30
            containerTopConstraints?.constant = 15
            containerTrailingConstraints?.constant = -30
            containerBottomConstraints?.constant = -15
            descriptionTitleLabel.isHidden = true
        }
    }

}
