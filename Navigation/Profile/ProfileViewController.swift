//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 11.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var headerView: ProfileHeaderView = {
            let view = ProfileHeaderView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
            
        private lazy var tableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
            tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
            tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
            tableView.backgroundColor = .clear
            tableView.backgroundColor = .systemGray6
            tableView.layer.borderColor = UIColor.lightGray.cgColor
            tableView.layer.borderWidth = 0.5
            return tableView
        }()
        
        private var heightConstraint: NSLayoutConstraint?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            profileHeaderViewSetup()
            setupTableView()
            addMyPost()
            print(myPost.count)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.isHidden = true
        }
        
        private func profileHeaderViewSetup() {
            self.headerView.backgroundColor = .systemGray4
            self.view.addSubview(self.headerView)
            
            NSLayoutConstraint.activate([
                headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
                headerView.heightAnchor.constraint(equalToConstant: 220),
                self.heightConstraint
            ].compactMap({$0}))
        }
        
        private func setupTableView() {
            self.view.addSubview(self.tableView)
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 220),
                tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ])

        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    }

    extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myPost.count + 1
        }
                
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as? PhotosTableViewCell else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                    return cell
                }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                    return cell
                }
                let article = myPost[indexPath.row - 1]
                let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                            description: article.description,
                                                            image: article.image,
                                                            likes: article.likes,
                                                            views: article.views)
                cell.setup(with: viewModel)
                return cell
            }
        }
        
        func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
            } else { return }
        }

}

