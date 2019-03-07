//
//  ResultTableViewCell.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/6/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo_400x400")
        return imageView
    }()
    
    var songLabel: UILabel = {
        return UIElements.createLabel(text: "song")
    }()
    
    var albumLabel: UILabel = {
        return UIElements.createLabel(text: "album", font: "AvenirNext", size: 15.0)
    }()
    
    var artistLabel: UILabel = {
        return UIElements.createLabel(text: "artist", font: "AvenirNext", size: 15.0)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        
        addSubview(coverImageView)
        addSubview(songLabel)
        addSubview(albumLabel)
        addSubview(artistLabel)
                
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        
        Constraints().constraintWithTopAndLeadingAnchor(field: coverImageView, width: 120, height: 120, topAnchor: topAnchor, topConstant: 20, leadingAnchor: leadingAnchor, leadingConstant: 20)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: songLabel, width: frame.width - 80, height: 20, topAnchor: topAnchor, topConstant: 20, leadingAnchor: coverImageView.trailingAnchor, leadingConstant: 10)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: albumLabel, width: frame.width - 80, height: 20, topAnchor: songLabel.bottomAnchor, topConstant: 6, leadingAnchor: coverImageView.trailingAnchor, leadingConstant: 10)
        
        Constraints().constraintWithTopAndLeadingAnchor(field: artistLabel, width: frame.width - 80, height: 20, topAnchor: albumLabel.bottomAnchor, topConstant: 6, leadingAnchor: coverImageView.trailingAnchor, leadingConstant: 10)
    }
}
