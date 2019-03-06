//
//  SearchView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    // Text field
    var textField: UITextField = {
        return UIElements.createTextField(placeholder: "*enter artist/song name*", keyboardType: .alphabet)
    }()
    
    // button
    var searchButton: UIButton = {
        return UIElements.createButton(text: "SEARCH")
    }()
    
    // table view
    var historyTableView: UITableView = {
       return UIElements.createTableView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        
        addSubview(textField)
        addSubview(searchButton)
        addSubview(historyTableView)
        
        setupConstraints()
        
        historyTableView.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupConstraints() {
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        historyTableView.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithTopAndCenterXAnchor(field: textField, width: UIElementSizes.textFieldWidth, height: UIElementSizes.singleLineTextFieldHeight, topAnchor: topAnchor, topConstant: 75.0, centerXAnchor: centerXAnchor, centerXConstant: 0.0)
        
        Constraints().constraintWithTopAndCenterXAnchor(field: searchButton, width: UIElementSizes.buttonWidth, height: UIElementSizes.buttonHeight, topAnchor: textField.bottomAnchor, topConstant: 25, centerXAnchor: centerXAnchor, centerXConstant: 0)

        Constraints().constraintWithTopBottomAndCenterXAnchor(field: historyTableView, width: UIElementSizes.windowWidth, topAnchor: searchButton.bottomAnchor, topConstant: 25, bottomAnchor: bottomAnchor, bottomConstant: -25, centerXAnchor: centerXAnchor, centerXConstant: 0.0)
    }
    
    func toggleHistoryTableViewVisibility() {
        historyTableView.isHidden = !historyTableView.isHidden
    }
}
