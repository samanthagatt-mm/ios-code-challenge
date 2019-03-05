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
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "*password*", attributes: [NSAttributedString.Key.foregroundColor: UIColor().HexToColor(hexString: "#FFFFFF", alpha: 0.5)])
        textField.backgroundColor = UIColor().HexToColor(hexString: "#0463AC", alpha: 1)
        textField.layer.borderColor = UIColor().HexToColor(hexString: "#2590E3", alpha: 1).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25
        textField.borderStyle = .line
        textField.keyboardType = .emailAddress
        textField.contentVerticalAlignment = .center
        textField.textAlignment = .center
        textField.textColor = UIColor().HexToColor(hexString: "#FFFFFF", alpha: 1)
        textField.font = UIFont(name: "AvenirNext-Regular", size: 20)
        textField.returnKeyType = .done
        textField.borderStyle = .none
        textField.layer.shadowColor = UIColor().HexToColor(hexString: "#000000", alpha: 1).cgColor
        textField.layer.shadowRadius = 5
        textField.layer.shadowOffset = CGSize(width: 0, height: 3)
        textField.layer.shadowOpacity = 1
        textField.layer.masksToBounds = false
        
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "*password*", attributes: [NSAttributedString.Key.foregroundColor: UIColor().HexToColor(hexString: "#FFFFFF", alpha: 0.5)])
        textField.backgroundColor = UIColor().HexToColor(hexString: "#0463AC", alpha: 1)
        textField.layer.borderColor = UIColor().HexToColor(hexString: "#2590E3", alpha: 1).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25
        textField.borderStyle = .line
        textField.keyboardType = .alphabet
        textField.contentVerticalAlignment = .center
        textField.textAlignment = .center
        textField.textColor = UIColor().HexToColor(hexString: "#FFFFFF", alpha: 1)
        textField.font = UIFont(name: "AvenirNext-Regular", size: 20)
        textField.returnKeyType = .done
        textField.borderStyle = .none
        textField.layer.shadowColor = UIColor().HexToColor(hexString: "#000000", alpha: 1).cgColor
        textField.layer.shadowRadius = 5
        textField.layer.shadowOffset = CGSize(width: 0, height: 3)
        textField.layer.shadowOpacity = 1
        textField.layer.masksToBounds = false
        
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel!.font = UIFont(name: "AvenirNext-DemiBold", size: 25)
        button.setTitleColor(UIColor().HexToColor(hexString: "#50A3E3", alpha: 1), for: .normal)
        button.backgroundColor = UIColor().HexToColor(hexString: "#000000", alpha: 0)
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor().HexToColor(hexString: "#000000", alpha: 0).cgColor
        
        return button
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
