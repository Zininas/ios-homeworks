//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Александр Зинин on 20.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var onLikesTap: ((_ post: Post) -> ())?
    var onImageViewTap: ((_ post: Post) -> ())?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            postImageView.image = UIImage(named: post.imageName)
            authorLabel.text = post.author
            descriptionLabel.text = post.description
            likesLabel.text = "Likes: \(post.likes)"
            viewsLabel.text = "Views: \(post.views)"
        }
    }
    
    lazy var postImageView: UIImageView = {
        let image = UIImage(named: "Николай II")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Author"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Description"
        return label
    }()
    
    lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Likes:"
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likesTapped)))
        return label
    }()
    
    lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Views:"
        return label
    }()
    
    func layout() {
        contentView.addSubview(postImageView)
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        let topAuthorLabelAnchor = authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        let leadingAuthorLabelAnchor = authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let trailingAuthorLabelAnchor = authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        
        let topPostImageViewAnchor = postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8)
        let leadingPostImageViewAnchor = postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let trailingPostImageViewAnchor = postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let heightPostImageViewAnchor = postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1)
        
        let topDescriptionLabelAnchor = descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16)
        let leadingDescriptionLabelAnchor = descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let trailingDescriptionLabelAnchor = descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        
        let topLikesLabelAnchor = likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16)
        let leadingLikesLabelAnchor = likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let bottomLikesLabelAnchor = likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        
        let topViewsLabelAnchor = viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16)
        let trailingViewsLabelAnchor = viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        let bottomViewsLabelAnchor = viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        
        NSLayoutConstraint.activate([
            topAuthorLabelAnchor, leadingAuthorLabelAnchor, trailingAuthorLabelAnchor, topPostImageViewAnchor, leadingPostImageViewAnchor, trailingPostImageViewAnchor, heightPostImageViewAnchor, topDescriptionLabelAnchor, leadingDescriptionLabelAnchor, trailingDescriptionLabelAnchor, topLikesLabelAnchor, leadingLikesLabelAnchor, bottomLikesLabelAnchor, topViewsLabelAnchor, trailingViewsLabelAnchor, bottomViewsLabelAnchor
        ])
    }
    
    @objc func likesTapped() {
        
        if var post = self.post, post.isLiked == false {
            post.isLiked.toggle()
            post.likes = post.likes + 1
            likesLabel.text = "Likes: \(post.likes)"
            onLikesTap?(post)
            return
        }
        
        if var post = self.post, post.isLiked == true {
            post.isLiked.toggle()
            post.likes = post.likes - 1
            likesLabel.text = "Likes: \(post.likes)"
            onLikesTap?(post)
            return
        }
    }
    
    @objc func imageViewTapped() {
        
        if var post = self.post, post.isViewed == false {
            post.isViewed.toggle()
            post.views = post.views + 1
            viewsLabel.text = "Views: \(post.views)"
            onImageViewTap?(post)
            return
        }
        
        if var post = self.post, post.isViewed == true {
            post.isViewed.toggle()
            viewsLabel.text = "Views: \(post.views)"
            onImageViewTap?(post)
            return
        }
    }
}
