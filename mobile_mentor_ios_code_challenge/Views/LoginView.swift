//
//  LoginView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var emailTextField: UITextField = {
        return UIElements.createTextField(placeholder: "*email*", keyboardType: .emailAddress)
    }()
    
    var passwordTextField: UITextField = {
        return UIElements.createTextField(placeholder: "*password*", keyboardType: .alphabet)
    }()
    
    var loginButton: UIButton = {
        return UIElements.createButton(text: "LOGIN")
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    fileprivate func setupView() {
        
        backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        
        setLogoImageViewImage()
        
        passwordTextField.isSecureTextEntry = true
        
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        // Calls setConstraints function so subviews show up
        setConstraints()
    }
    
    fileprivate func setLogoImageViewImage() {
        
        let image = UIImage(named: "logo_400x400")
        
        logoImageView.image = image
        
    }
    
    fileprivate func setConstraints() {
        
        // Fixes conflicting constraints
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithTopAndCenterXAnchor(field: logoImageView, width: 150, height: 150, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarMaxY + 75, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        Constraints().constraintWithTopAndCenterXAnchor(field: emailTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: logoImageView.bottomAnchor, topConstant: 25, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        Constraints().constraintWithTopAndCenterXAnchor(field: passwordTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: emailTextField.bottomAnchor, topConstant: 15, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        Constraints().constraintWithTopAndCenterXAnchor(field: loginButton, width: UIElementSizes.buttonWidth, height: UIElementSizes.buttonHeight, topAnchor: passwordTextField.bottomAnchor, topConstant: 25, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
    }
    
}
