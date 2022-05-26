//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 23.05.2022.
//

import UIKit

let image1 = UIImage(named: "1")
let image2 = UIImage(named: "2")
let image3 = UIImage(named: "3")
let image4 = UIImage(named: "4")
let image5 = UIImage(named: "5")
let image6 = UIImage(named: "6")
let image7 = UIImage(named: "7")
let image8 = UIImage(named: "8")
let image9 = UIImage(named: "9")
let image10 = UIImage(named: "10")
let image11 = UIImage(named: "11")
let image12 = UIImage(named: "12")
let image13 = UIImage(named: "13")
let image14 = UIImage(named: "14")
let image15 = UIImage(named: "15")
let image16 = UIImage(named: "16")
let image17 = UIImage(named: "17")
let image18 = UIImage(named: "18")
let image19 = UIImage(named: "19")
let image20 = UIImage(named: "20")

class PhotosViewController: UIViewController {

    var images = [image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, image11, image12, image13, image14, image15, image16, image17, image18, image19, image20 ]
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var photosCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "photosCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigationBar()
        activateConstraints()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Photo Gallery"
    }
    
    private func activateConstraints() {
        view.addSubview(photosCollectionView)
        
        let topPhotosCollectionViewCnstrnt = photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingPhotosCollectionViewCnstrnt = photosCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        let trailingPhotosCollectionViewCnstrnt = photosCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        let bottomPhotosCollectionViewCnstrnt = photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topPhotosCollectionViewCnstrnt, leadingPhotosCollectionViewCnstrnt, trailingPhotosCollectionViewCnstrnt, bottomPhotosCollectionViewCnstrnt
        ])
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 2 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
     
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.backgroundColor = .systemGreen
        let image = images[indexPath.row]
        cell.setup(with: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
}
