//
//  LoginController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    let mainView: MainView = { return MainView() }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIElementSizes.navigationBarMaxY += navigationController!.navigationBar.frame.maxY
        
        setupUserAccounts()
        
        setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.passwordTextField.text = ""
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupUserAccounts() {
        
        // Adds a default user and password for quick testing
        let defaultUsers = ["jane.smith@email.com", "john.doe@email.com", "test"]
        let defaultUserPasswords = ["test1234%^&*", "*&^%4321tset", "test"]
        
        var userCount = 0
        
        repeat {
            UserAccountViewModel.userEmail = defaultUsers[userCount]
            UserAccountViewModel.userPassword = defaultUserPasswords[userCount]
            UserAccountViewModel().setUserDict()
            // Increments userCount so while condition will become false
            userCount += 1
        } while userCount < defaultUsers.count
        
    }
    
    fileprivate func setupView() {
        mainView.emailTextField.delegate = self
        mainView.passwordTextField.delegate = self
        mainView.passwordTextField.isSecureTextEntry = true

        let dismissKeyboardTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dismissKeyboardTapGestureRecognizer.cancelsTouchesInView = false
        mainView.addGestureRecognizer(dismissKeyboardTapGestureRecognizer)
        
        // Adds the login action to the login button
        mainView.loginButton.addTarget(self, action: #selector(handleLoginButtonTap(sender:)), for: .touchUpInside)
        
        view.addSubview(mainView)
        // Constrains mainView to the view controller's view
        mainView.translatesAutoresizingMaskIntoConstraints = false
        Constraints().constraintWithTopAndLeadingAnchor(field: mainView, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height, topAnchor: view.safeAreaLayoutGuide.topAnchor, topConstant: 0.0, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, leadingConstant: 0.0)
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func handleLoginButtonTap(sender: UIButton) {
        
        guard let emailAddress = mainView.emailTextField.text?.lowercased(),
            let password = mainView.passwordTextField.text else { return }
        
        if let user = getUser(emailAddress: emailAddress) {
            guard let savedPassword = UserAccounts.userPasswords[user] else { return }
            UserAccountViewModel.userEmail = emailAddress
            comparePassword(password: password, savedPassword: savedPassword)
        } else {
            let alertController = CreateAlertController().withNoActions(title: "User Account Not Found", message: "The user account that you are attempting to use does not exist.")
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertController, animated: true) {
                self.mainView.passwordTextField.text = ""
            }
        }
    }
    
    fileprivate func getUser(emailAddress: String) -> Int? {
        var dictKey: Int?
        for item in UserAccounts.userAccountEmail {
            if item.value == emailAddress {
                dictKey = item.key
            }
        }
        return dictKey
    }
    
    fileprivate func comparePassword(password: String, savedPassword: String) {
        if password == savedPassword {
            print("User Login Successful. Navigate to SearchController")
        } else {
            let alertController = CreateAlertController().withCancelAction(title: "Incorrect Password", message: "Please re-enter your password and try again.")
            
            present(alertController, animated: true) {
                self.mainView.passwordTextField.text = ""
                self.mainView.passwordTextField.becomeFirstResponder()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
