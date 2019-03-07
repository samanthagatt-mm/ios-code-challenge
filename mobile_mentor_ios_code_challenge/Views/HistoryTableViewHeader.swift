//
//  HistoryTableViewHeader.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/7/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class HistoryTableViewHeader: UITableViewHeaderFooterView {
    
    var titleLabel: UILabel = {
        let label = UIElements.createLabel(text: "Search History", size: 15)
        label.textColor = UIColor().HexToColor(hexString: "#FFFFFF")
        return label
    }()
    
    var clearButton: UIButton = {
        let button = UIElements.createButton(text: "Clear", font: "AvenirNext", size: 6)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor().HexToColor(hexString: "#D63031", alpha: 0.8)
        
        addSubview(titleLabel)
        addSubview(clearButton)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithCenterYAndCenterXAnchor(field: titleLabel, width: 100, height: 20, centerYAnchor: centerYAnchor, centerYConstant: 0, centerXAnchor: centerXAnchor, centerXConstant: 0)
        Constraints().constraintWithCenterYAnchorAndTrailing(field: clearButton, width: 100, height: 20, centerYAnchor: centerYAnchor, centerYConstant: 0, trailingAnchor: trailingAnchor, trailingConstant: 0)
    }
}
