//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александр Зинин on 23.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let photoImageView1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let photoImageView2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let photoImageView3: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "3"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let photoImageView4: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "4"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Photos"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let transitionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupCell() {
        addSubview(photosStackView)
        addSubview(titleLabel)
        addSubview(transitionButton)
        photosStackView.addArrangedSubview(photoImageView1)
        photosStackView.addArrangedSubview(photoImageView2)
        photosStackView.addArrangedSubview(photoImageView3)
        photosStackView.addArrangedSubview(photoImageView4)
     
        let topStackViewCnstrnt = photosStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12)
        let bottomStackViewCnstrnt = photosStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        let leadingStackViewCnstrnt = photosStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        let trailingStackViewCnstrnt = photosStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        let heightImageViewCnstrnt = photoImageView1.heightAnchor.constraint(equalTo: photoImageView1.widthAnchor, multiplier: 1)
        
        let topTitleLabelCnstrnt = titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12)
        let leadingTitleLabelCnstrnt = titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        
        let trailingTransitionButtonCnstrnt = transitionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        let topTransitionButtonCnstrnt = transitionButton.topAnchor.constraint(equalTo: topAnchor, constant: 12)
        let centerYTransitionButtonCnstrnt = transitionButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        
        NSLayoutConstraint.activate([
            topStackViewCnstrnt, bottomStackViewCnstrnt, leadingStackViewCnstrnt, trailingStackViewCnstrnt, heightImageViewCnstrnt, topTitleLabelCnstrnt, leadingTitleLabelCnstrnt, trailingTransitionButtonCnstrnt, topTransitionButtonCnstrnt, centerYTransitionButtonCnstrnt
        ])
    }
}
