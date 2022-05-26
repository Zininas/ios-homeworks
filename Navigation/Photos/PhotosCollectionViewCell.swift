//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Александр Зинин on 23.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var startingFrame: CGRect?
    private var buttonClose = UIButton()
    private var backView = UIView(frame: .zero)
    private var zoomingImageView = UIImageView(frame: .zero)
   
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomImageView)))
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func activateConstraints() {
        addSubview(imageView)
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setup(with image: UIImage?) {
        self.imageView.image = image
    }
    
    @objc func zoomImageView() {
        self.startingFrame = imageView.superview?.convert(imageView.frame, to: nil)
        zoomingImageView = UIImageView(frame: startingFrame!)
        zoomingImageView.backgroundColor = .black
        zoomingImageView.image = imageView.image
        
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
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.backView.alpha = 0.8
                
                self.zoomingImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: self.backView.frame.height / 2)
                self.zoomingImageView.center = keyWindow.center
            } completion: { _ in }
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.buttonClose.alpha = 1
            } completion: { _ in }


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
    
    @objc func buttonTapped() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.buttonClose.alpha = 0
            self.backView.alpha = 0
            self.imageView.alpha = 1
            self.imageView.isHidden = false
            self.zoomingImageView.frame = self.startingFrame!
            self.zoomingImageView.alpha = 0
        }, completion: nil)
    }
}
