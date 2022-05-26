//
//  LogInViewController.swift
//  Navigation
//
//  Created by Александр Зинин on 19.05.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let notify = NotificationCenter.default
        
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapKeyboardOff(_:)))
        view.addGestureRecognizer(tap)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        notify.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notify.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
//     Сдвигаем scrollView.bottom вверх на высоту клавиатуры
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + 32
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 32, right: 0)
        }
    }
//     Восстанавливаем исходное значение scrollView.bottom
    @objc private func keyboardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private let logoImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo.jpg")
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.spacing = 0.5
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .lightGray
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.lightGray.cgColor
        return $0
    }(UIStackView())
    
    private lazy var userLoginTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.indent(size: 10)
        $0.placeholder = "Email or phone"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.autocapitalizationType = .none
        $0.backgroundColor = .systemGray6
        $0.delegate = self
        return $0
    }(UITextField())
    
    private lazy var userPasswordTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.indent(size: 10)
        $0.placeholder = "Password"
        $0.isSecureTextEntry = true
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.backgroundColor = .systemGray6
        $0.delegate = self
        return $0
    }(UITextField())
    
    private lazy var logInButton: UIButton = {
        let colorButton = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Войти", for: .normal)
        $0.backgroundColor = colorButton
        $0.layer.cornerRadius = 10
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor?.withAlphaComponent(1)
        if $0.isSelected || $0.isHighlighted || $0.isEnabled == false {
            $0.backgroundColor?.withAlphaComponent(0.8)
        }
        $0.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var invalidLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 12)
        $0.numberOfLines = 8
        $0.contentMode = .scaleToFill
        $0.textAlignment = .center
        $0.isHidden = true
        return $0
    }(UILabel())
    
    private lazy var validationData = ValidationData()
    
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
                        
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // !!! Обязательно выставить ширину contentView !!!
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        [logoImage, stackView, logInButton, invalidLabel].forEach { contentView.addSubview($0) }
        [userLoginTextField, userPasswordTextField].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            // logoImage
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            // stackView
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            // firstButton
            userLoginTextField.heightAnchor.constraint(equalToConstant: 50),
            // secondButton
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            // logInButton
            logInButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            
            invalidLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor),
            invalidLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            invalidLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        
//            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func validEmail(email: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validEmail = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return validEmail.evaluate(with: email)
    }

    private func validPassword(password : String) -> Bool {
        let passwordReg =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,}")
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTesting.evaluate(with: password) && password.count > 6
    }
    
    @objc func buttonClicked() {
        let profileViewController = ProfileViewController()
        guard let email = userLoginTextField.text else {return}
        guard let password = userPasswordTextField.text else {return}
        let enteredEmail = validEmail(email: email)
        let enteredPassword = validPassword(password: password)
        
        if email.isEmpty && password.isEmpty {
            userLoginTextField.shake()
            userPasswordTextField.shake()
        } else if email.isEmpty {
            userLoginTextField.shake()
        } else if password.isEmpty {
            userPasswordTextField.shake()
        } else {
            if !enteredPassword && !enteredEmail {
                invalidLabel.text = validationData.invalidEmailAndPassword
                invalidLabel.isHidden = false
                userPasswordTextField.shake()
                userLoginTextField.shake()
            } else if !enteredPassword {
                invalidLabel.text = validationData.invalidPassword
                invalidLabel.isHidden = false
                userPasswordTextField.shake()
            } else if !enteredEmail {
                invalidLabel.text = validationData.invalidEmail
                invalidLabel.isHidden = false
                userLoginTextField.shake()
            } else {
                if (enteredEmail && enteredPassword) && (userLoginTextField.text != validationData.defaultLogin || userPasswordTextField.text != validationData.defaultPassword) {
                    let alert = UIAlertController(title: "Неверный логин или пароль", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                } else {
                    navigationController?.pushViewController(profileViewController, animated: true)
                    invalidLabel.isHidden = true
                }
            }
        }
    }
    
    @objc func tapKeyboardOff(_ sender: Any) {
        userLoginTextField.resignFirstResponder()
        userPasswordTextField.resignFirstResponder()
    }
    
    @objc private func adjustForKeyboard(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let screenHeight = UIScreen.main.bounds.height
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
          //  self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
            let difference = keyboardHeight - ((screenHeight / 2) - 165)
            if ((screenHeight / 2) - 165) <= keyboardHeight {
                let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification ? .zero : CGPoint(x: 0, y:  difference)
                self.scrollView.setContentOffset(contentOffset, animated: true)
            }
        }
    }
    
}
// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
