//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 11.05.2022.
//

import UIKit


class ProfileViewController: UIViewController {

    let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
       
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerViewSetup()
    }
    
    private func headerViewSetup() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func hideKeyboard() {
        headerView.statusTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
}

