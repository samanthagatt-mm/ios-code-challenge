//
//  HistoryTableViewCell.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/7/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    var termLabel: UILabel = {
        return UIElements.createLabel(text: "term", font: "AvenirNext", size: 15.0)
    }()
    
    var dateLabel: UILabel = {
        let label = UIElements.createLabel(text: "term", font: "AvenirNext", size: 15.0)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
        addSubview(stackView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDate(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY hh:mm:ss"
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(termLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    func setupConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        termLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithCenterYAndCenterXAnchor(field: stackView, width: UIElementSizes.windowWidth - 30, height: frame.height, centerYAnchor: centerYAnchor, centerYConstant: 0, centerXAnchor: centerXAnchor, centerXConstant: 10)
    }
}
