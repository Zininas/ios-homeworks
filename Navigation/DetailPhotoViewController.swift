//
//  DetailPhotoViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 23.05.2022.
//

import UIKit

class DetailPhotoViewController: UIViewController {

    var selectedImage: String?
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        self.view.addSubview(photoImageView)
        NSLayoutConstraint.activate([
            self.photoImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.photoImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.photoImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    

}
