//
//  InfoViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 12.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        infoButton()
    }
    private func infoButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        button.center = view.center
        button.setTitle("Внести данные", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tapAction() {
        let alert = UIAlertController(title: "Условия подписки:", message: "Вам исполнилось 18 лет?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in

            self.navigationController?.popViewController(animated: true)
            print("Исполнилось 18 лет.")
        }
        let cancelAction = UIAlertAction(title: "Нет", style: .destructive)
        
        alert.addAction(cancelAction)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
