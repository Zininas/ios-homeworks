//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр Зинин on 13.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    var nameLabel: UILabel!
    var statusLabel: UILabel!
    var userAvatar: UIImageView!
    var statusButton: UIButton!
    var statusTextField: UITextField!
    
    private var statusText: String = "Последний Император..."
    
    private var statusButtonTop: NSLayoutConstraint?
    private var statusButtonTopMoved: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = .lightGray
        userAvatar = UIImageView()
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        userAvatar.image = UIImage(named: "Николай II")
        userAvatar.layer.cornerRadius = 75
        userAvatar.layer.borderWidth = 3
        userAvatar.layer.masksToBounds = true
        userAvatar.layer.borderColor = UIColor.white.cgColor
        
        let userAvatarWidth = userAvatar.widthAnchor.constraint(equalToConstant: 150)
        let userAvatarHeight = userAvatar.heightAnchor.constraint(equalToConstant: 150)
        let userAvatarTop = userAvatar.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
        let userAvatarLeading = userAvatar.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        
        self.addSubview(userAvatar)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.text = "Николай II"
        nameLabel.textAlignment = .left
        
        let nameLabelTop = nameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27)
        let nameLabelLeading = nameLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor,constant: 16)
        let nameLabelTrailing = nameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(nameLabel)
        
        statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .blue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(statusTextChanged), for: .touchUpInside)
        
        let statusButtonHeight = statusButton.heightAnchor.constraint(equalToConstant: 50)
        self.statusButtonTop = statusButton.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 16)
        let statusButtonLeading = statusButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let statusButtonTrailing = statusButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(statusButton)
        
        statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = statusText
        
        let statusLabelBottom = statusLabel.bottomAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: -16)
        let statusLabelLeading = statusLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 16)
        let statusLabelTrailing = statusLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(statusLabel)
        
        statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.masksToBounds = true
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.alpha = 0
        
        let statusTextFieldWidth = statusTextField.widthAnchor.constraint(equalToConstant: 200)
        let statusTextFieldHeight = statusTextField.heightAnchor.constraint(equalToConstant: 40)
        let statusTextFieldTop = statusTextField.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 20)
        let statusTextFieldLeading = statusTextField.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 16)
        let statusTextFieldTrailing = statusTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(statusTextField)
       
        NSLayoutConstraint.activate([
            userAvatarWidth,
            userAvatarHeight,
            userAvatarTop,
            userAvatarLeading,
            
            nameLabelTop,
            nameLabelLeading,
            nameLabelTrailing,
            
            statusButtonHeight,
            statusButtonTop,
            statusButtonLeading,
            statusButtonTrailing,
            
            statusLabelBottom,
            statusLabelLeading,
            statusLabelTrailing,
            
            statusTextFieldWidth,
            statusTextFieldHeight,
            statusTextFieldTop,
            statusTextFieldLeading,
            statusTextFieldTrailing
        ].compactMap({$0}))
        
    }
    
    @objc func statusTextChanged() {
        if self.statusTextField.alpha == 0 {
            self.statusButtonTopMoved = self.statusButton.topAnchor.constraint(equalTo: self.userAvatar.bottomAnchor, constant: 65)
            NSLayoutConstraint.deactivate([self.statusButtonTop].compactMap({$0}))
            NSLayoutConstraint.activate([self.statusButtonTopMoved].compactMap({$0}))
            self.statusTextField.alpha = 1
        } else {
            self.statusButtonTop = self.statusButton.topAnchor.constraint(equalTo: self.userAvatar.bottomAnchor, constant: 16)
            NSLayoutConstraint.deactivate([self.statusButtonTopMoved].compactMap({$0}))
            NSLayoutConstraint.activate([self.statusButtonTop].compactMap({$0}))
            self.statusTextField.alpha = 0
            self.statusLabel.text = self.statusTextField.text
            if self.statusLabel.text == "" {
                self.statusLabel.text = self.statusText
            }
        }
    }
}
