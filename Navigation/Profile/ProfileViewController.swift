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
    
    private lazy var setTitleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set title", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapSetTitleButton), for: .touchUpInside)
        return button
    }()
    
    private var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerViewSetup()
        setTitleButtonSetup()
       
    }
     
    private func headerViewSetup() {
        self.view.addSubview(self.headerView)
        self.view.addSubview(setTitleButton)
        self.view.backgroundColor = .lightGray
        
        let topConstraint = self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.headerView.heightAnchor.constraint(equalToConstant: 220)
        
        NSLayoutConstraint.activate([
            topConstraint,
            leadingConstraint,
            trailingConstraint,
            self.heightConstraint
        ].compactMap({$0}))
    }
    
    private func setTitleButtonSetup() {
        self.view.addSubview(setTitleButton)
        
        let setTitleButtonHeightConstraint = self.setTitleButton.heightAnchor.constraint(equalToConstant: 50)
        let setTitleButtonBottomConstraint = self.setTitleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let setTitleButtonLeadingConstraint = self.setTitleButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let setTitleButtonTrailingConstraint = self.setTitleButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        
        NSLayoutConstraint.activate([
            setTitleButtonHeightConstraint,
            setTitleButtonBottomConstraint,
            setTitleButtonLeadingConstraint,
            setTitleButtonTrailingConstraint
        ])
    }
    
    @objc func didTapSetTitleButton() {
        let ac = UIAlertController(title: "Set title", message: "Enter new title", preferredStyle: .alert)
        ac.addTextField()
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self, weak ac] _ in
            guard let newTitle = ac?.textFields?[0].text else {return}
            if newTitle.isEmpty {
                let ac = UIAlertController(title: "You should enter something", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                ac.addAction(okAction)
                self?.present(ac, animated: true)
            }
            self?.headerView.changeTitle(title: newTitle)
        }
        ac.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        present(ac, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

