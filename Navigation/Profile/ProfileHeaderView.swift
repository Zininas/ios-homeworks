//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр Зинин on 13.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let imageViewHeight: CGFloat = 130
    private var statusText = readLine()
    
    var heightImageViewCnstrnt: NSLayoutConstraint!
    var widthImageViewCnstrnt: NSLayoutConstraint!
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemMint
        imageView.image = UIImage(named: "Николай II")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageViewHeight / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Николай II"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "Последний Император..."
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.backgroundColor = .systemBlue
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(statusChangeButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.returnKeyType = .continue
        textField.clearButtonMode = .always
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .yes
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layoutMargins.left = 20
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textColor = .black
        textField.placeholder = "Set your status"
        textField.font = UIFont(name: "Helvetica-Regular", size: 15)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.backgroundColor = .systemGray5
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.addSubview(avatarImageView)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
        
        let topImageViewCnstrnt = self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leadingImageViewCnstrnt = self.avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        self.heightImageViewCnstrnt = self.avatarImageView.heightAnchor.constraint(equalToConstant: 130)
        self.widthImageViewCnstrnt = self.avatarImageView.widthAnchor.constraint(equalToConstant: 130)
        
        let topNameLabelCnstrnt = self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27)
        let leadingNameLabelCnstrnt = self.nameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let trailingNameLabelCnstrnt = self.nameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        
        let topStatusLabelCnstrnt = self.statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 54)
        let leadingStatusLabelCnstrnt = self.statusLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let trailingStatusLabelCnstrnt = self.statusLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        
        let topStatusButtonConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 48)
        let spacingStatusButton = self.setStatusButton.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 72)
        let leadingSetStatusButtonCnstrnt = self.setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailingSetStatusButtonCnstrnt = self.setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightSetStatusButtonCnstrnt = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        
        let topStatusTextFieldCnstrnt = self.statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 8)
        let leadingStatusTextFieldCnstrnt = self.statusTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let trailingStatusTextFieldCnstrnt = self.statusTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightStatusTextFieldCnstrnt = self.statusTextField.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([
            topImageViewCnstrnt, leadingImageViewCnstrnt, widthImageViewCnstrnt, heightImageViewCnstrnt, topNameLabelCnstrnt, leadingNameLabelCnstrnt, trailingNameLabelCnstrnt, topStatusLabelCnstrnt, leadingStatusLabelCnstrnt, trailingStatusLabelCnstrnt, topStatusButtonConstraint, spacingStatusButton, leadingSetStatusButtonCnstrnt, trailingSetStatusButtonCnstrnt, heightSetStatusButtonCnstrnt, topStatusTextFieldCnstrnt, leadingStatusTextFieldCnstrnt, trailingStatusTextFieldCnstrnt, heightStatusTextFieldCnstrnt
        ])
    }
    
    @objc func statusChangeButtonPressed() {
        if self.statusTextField.text == "" {
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut) {
                self.statusTextField.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
                self.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut) {
                    self.statusTextField.backgroundColor = .white
                }
            }

            return
        }
        
        self.statusLabel.text = self.statusText
        self.statusTextField.text = ""
        
        self.statusTextField.delegate = self
        self.endEditing(true)
    }
    
    @objc func statusTextChanged() {
        statusText = statusTextField.text
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusTextField.resignFirstResponder()
        setStatusButton.resignFirstResponder()
        return true
    }
}
