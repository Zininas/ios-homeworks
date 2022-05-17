//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр Зинин on 13.05.2022.
//

import UIKit

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
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
                      
        self.addSubview(userAvatar)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.text = "Николай II"
        nameLabel.textAlignment = .left
        
        self.addSubview(nameLabel)
        
        statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(statusTextChanged), for: .touchUpInside)
        
        self.addSubview(statusButton)
        
        statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = statusText
          
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
        statusTextField.indent(size: 8)
              
        self.addSubview(statusTextField)
       
        NSLayoutConstraint.activate([
            userAvatar.widthAnchor.constraint(equalToConstant: 150),
            userAvatar.heightAnchor.constraint(equalToConstant: 150),
            userAvatar.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16),
            userAvatar.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16),
            
            nameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor,constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16),
            
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 45),
            statusButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16),
            
            statusLabel.bottomAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16),
            
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: -8),
            statusTextField.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        ].compactMap({$0}))
        
    }
    
    @objc func statusTextChanged() {
        self.statusButtonTop = self.statusButton.topAnchor.constraint(equalTo: self.userAvatar.bottomAnchor, constant: 16)

            self.statusLabel.text = self.statusTextField.text
            if self.statusLabel.text == "" {
                self.statusLabel.text = self.statusText
        }
    }
}


