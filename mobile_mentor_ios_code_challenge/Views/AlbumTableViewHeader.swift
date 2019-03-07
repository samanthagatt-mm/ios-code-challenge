//
//  AlbumTableViewHeader.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/6/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class AlbumTableViewHeader: UITableViewHeaderFooterView {
    
    var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo_400x400")
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UIElements.createLabel(text: "title")
        label.numberOfLines = 0
        return label
    }()
    
    var artistLabel: UILabel = {
        return UIElements.createLabel(text: "artist", font: "AvenirNext", size: 15.0)
    }()
    
    var genreYearLabel: UILabel = {
        return UIElements.createLabel(text: "genre • year", font: "AvenirNext", size: 15.0)
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        
        addSubview(coverImageView)
        addSubview(titleLabel)
        addSubview(artistLabel)
        addSubview(genreYearLabel)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        genreYearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithTopAndLeadingAnchor(field: coverImageView, width: 120, height: 120, topAnchor: topAnchor, topConstant: 20, leadingAnchor: leadingAnchor, leadingConstant: 20)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: titleLabel, width: UIElementSizes.windowWidth - 160, height: 60, topAnchor: topAnchor, topConstant: 20, leadingAnchor: coverImageView.trailingAnchor, leadingConstant: 10)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: artistLabel, width: UIElementSizes.windowWidth - 160, height: 20, topAnchor: titleLabel.bottomAnchor, topConstant: 6, leadingAnchor: coverImageView.trailingAnchor, leadingConstant: 10)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: genreYearLabel, width: UIElementSizes.windowWidth - 160, height: 20, topAnchor: artistLabel.bottomAnchor, topConstant: 6, leadingAnchor: coverImageView.trailingAnchor, leadingConstant: 10)
    }
}
