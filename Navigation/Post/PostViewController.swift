//
//  PostViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 11.05.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    private let imageViewHeight: CGFloat = 130
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private var startingFrame: CGRect?
    private var buttonClose = UIButton()
    private var backView = UIView(frame: .zero)
    private var zoomingImageView = UIImageView(frame: .zero)
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .systemPink
        imageView.image = UIImage(named: "Николай II")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageViewHeight / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        layout()
        setupGesture()
    }
    
    private func layout() {
        view.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ].compactMap({ $0 }))
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.avatarImageView.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        zoomImageView()
    }
    
    @objc func buttonTapped() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.buttonClose.alpha = 0
            self.backView.alpha = 0
            self.avatarImageView.alpha = 1
            self.avatarImageView.isHidden = false
            self.zoomingImageView.frame = self.startingFrame!
            self.zoomingImageView.alpha = 0
        }, completion: nil)
    }
    
    func zoomImageView() {
        self.startingFrame = avatarImageView.superview?.convert(avatarImageView.frame, to: nil)
        zoomingImageView = UIImageView(frame: startingFrame!)
        zoomingImageView.backgroundColor = .systemPink
        zoomingImageView.image = avatarImageView.image
        
        if let keyWindow = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).flatMap({ $0.windows }).first(where: { $0.isKeyWindow }) {
            backView = UIView(frame: keyWindow.frame)
            
            setup(buttonClose)
            setup(backView)
            
            keyWindow.addSubview(backView)
            keyWindow.addSubview(zoomingImageView)
            keyWindow.addSubview(buttonClose)
            
            NSLayoutConstraint.activate([
                self.buttonClose.topAnchor.constraint(equalTo: self.backView.safeAreaLayoutGuide.topAnchor, constant: 16),
                self.buttonClose.trailingAnchor.constraint(equalTo: self.backView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                self.buttonClose.widthAnchor.constraint(equalToConstant: 20),
                self.buttonClose.heightAnchor.constraint(equalToConstant: 20)
            ])
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                self.backView.alpha = 0.8
                self.avatarImageView.isHidden = true
                self.avatarImageView.alpha = 0
                
                self.zoomingImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: self.view.frame.height / 2)
                self.zoomingImageView.center = keyWindow.center
            } completion: { _ in }
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.buttonClose.alpha = 1
            }
        }
    }
    
    func setup(_ button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setup(_ view: UIView) {
        view.backgroundColor = .darkGray
        view.alpha = 0
    }
    
}
