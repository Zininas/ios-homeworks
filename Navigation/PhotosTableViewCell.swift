//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александр Зинин on 23.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var stackViewHorizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var stackViewLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "3")
        return imageView
    }()
    
    private lazy var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "5")
        return imageView
    }()
    
    private lazy var fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "7")
        return imageView
    }()

    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = arrow
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackViewVertical)
        self.stackViewLabels.addArrangedSubview(self.photosLabel)
        self.stackViewLabels.addArrangedSubview(self.arrowImageView)
        self.stackViewVertical.addArrangedSubview(self.stackViewLabels)
        self.stackViewVertical.addArrangedSubview(self.stackViewHorizontal)
        self.stackViewHorizontal.addArrangedSubview(self.firstImageView)
        self.stackViewHorizontal.addArrangedSubview(self.secondImageView)
        self.stackViewHorizontal.addArrangedSubview(self.thirdImageView)
        self.stackViewHorizontal.addArrangedSubview(self.fourthImageView)
        
        NSLayoutConstraint.activate(backViewConstraints() + stackViewLabelsConstraints() + stackViewVerticalConstraints())
    }
    
    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        let heightConstraint = self.backView.heightAnchor.constraint(equalToConstant: 140)
        
        return [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint, heightConstraint]
    }
    
    private func stackViewVerticalConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackViewVertical.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let bottomConstraint = self.stackViewVertical.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12)
        let leadingConstraint = self.stackViewVertical.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let trailingConstraint = self.stackViewVertical.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)

        return [topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]
    }
    
    private func stackViewLabelsConstraints() -> [NSLayoutConstraint] {
        let arrowHeightConstraint = self.arrowImageView.heightAnchor.constraint(equalTo: self.arrowImageView.widthAnchor, multiplier: 0.8)
        let arrowWidthConstraint = self.arrowImageView.widthAnchor.constraint(equalTo: self.arrowImageView.heightAnchor, multiplier: 1.0)
        let heightConstraint = self.stackViewLabels.heightAnchor.constraint(equalToConstant: 12)

        return [arrowHeightConstraint, arrowWidthConstraint, heightConstraint]
    }

}
