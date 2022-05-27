//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 11.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let postCellID = "postCell"
    let photosCellID = "photosCell"
    
    var posts = [post1, post2, post3, post4]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
  
    private var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        activateConstraints()
    }
    
    func setupTableView() {
        self.view.backgroundColor = .white
        navigationItem.title = "Profile"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: postCellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosCellID)
    }
    
    func activateConstraints() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate { }

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let photosCell = tableView.dequeueReusableCell(withIdentifier: photosCellID, for: indexPath)
            return photosCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: postCellID, for: indexPath) as! PostTableViewCell
            let post = posts[indexPath.row - 1]
            cell.post = post
            cell.onLikesTap = { post in
                self.posts[indexPath.row - 1] = post
                cell.post = post
            }
            
            let detailedPostVC = DetailedPostViewController()
           
            cell.onImageViewTap = { post in
                self.posts[indexPath.row - 1] = post
                cell.post = post
                self.navigationController?.present(detailedPostVC, animated: true)
                detailedPostVC.postImageView.image = UIImage(named: post.imageName)
                detailedPostVC.descriptionLabel.text = post.description
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 270
    }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, complition) in
            self.posts.remove(at: indexPath.row - 1)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            complition(true)
        }
        action.backgroundColor = .systemRed
        action.image = UIImage(systemName: "minus.circle.fill")
        return action
    }
}

