//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Александр Зинин on 20.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let author: String
        let description: String
        let image: UIImage
        var likes: Int
        var views: Int
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        return view
    }()
    
    private lazy var stackViewPost: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var stackViewLikesViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.headerLabel.text = nil
        self.pictureImageView.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackViewPost)
        self.stackViewPost.addArrangedSubview(self.headerLabel)
        self.stackViewPost.addArrangedSubview(self.pictureImageView)
        self.stackViewPost.addArrangedSubview(self.descriptionLabel)
        self.stackViewPost.addArrangedSubview(self.stackViewLikesViews)
        self.stackViewLikesViews.addArrangedSubview(self.likesLabel)
        self.stackViewLikesViews.addArrangedSubview(self.viewsLabel)
        self.stackViewPost.backgroundColor = .white
        
        let backViewConstraints = self.backViewConstraints()
        let stackViewPostConstraints = self.stackViewPostConstraints()

        NSLayoutConstraint.activate(
            backViewConstraints +
            stackViewPostConstraints)
    }
    
    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        
        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    private func stackViewPostConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackViewPost.topAnchor.constraint(equalTo: self.backView.topAnchor)
        let leadingConstraint = self.stackViewPost.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackViewPost.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        let bottomConstraint = self.stackViewPost.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint,
        ]
    }
    
    private func stackViewLikesViewsConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackViewLikesViews.topAnchor.constraint(greaterThanOrEqualTo: self.stackViewPost.bottomAnchor, constant: 20)
        let leadingConstraint = self.stackViewLikesViews.leadingAnchor.constraint(equalTo: self.stackViewPost.leadingAnchor)
        let trailingConstraint = self.stackViewLikesViews.trailingAnchor.constraint(equalTo: self.stackViewPost.trailingAnchor)
        let bottomConstraint = self.stackViewLikesViews.bottomAnchor.constraint(equalTo: self.stackViewPost.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }

}

extension PostTableViewCell: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        
        self.headerLabel.text = viewModel.author
        self.descriptionLabel.text = viewModel.description
        self.pictureImageView.image = viewModel.image
        self.likesLabel.text = "Likes: \(String(viewModel.likes))"
        self.viewsLabel.text = "Views: \(String(viewModel.views))"
    }
}
