//
//  UIElements.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class UIElements {
    
    static func createTextField(placeholder: String, keyboardType: UIKeyboardType) -> UITextField {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor().HexToColor(hexString: "#FFFFFF", alpha: 0.5)])
        textField.backgroundColor = UIColor().HexToColor(hexString: "#0463AC", alpha: 1)
        textField.layer.borderColor = UIColor().HexToColor(hexString: "#2590E3", alpha: 1).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25
        textField.borderStyle = .line
        textField.keyboardType = keyboardType
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
    }
    
    static func createButton(text: String) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel!.font = UIFont(name: "AvenirNext-DemiBold", size: 25)
        button.setTitleColor(UIColor().HexToColor(hexString: "#50A3E3", alpha: 1), for: .normal)
        button.backgroundColor = UIColor().HexToColor(hexString: "#000000", alpha: 0)
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor().HexToColor(hexString: "#000000", alpha: 0).cgColor
        
        return button
    }
    
    static func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        return tableView
    }
}
