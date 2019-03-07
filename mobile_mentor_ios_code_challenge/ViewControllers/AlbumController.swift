//
//  AlbumController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/6/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class AlbumController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView = { return UITableView() }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        tableView.backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SongCell")
        tableView.register(AlbumTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "AlbumHeader")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        Constraints().constraintWithTopAndLeadingAnchor(field: tableView, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height - 120, topAnchor: view.safeAreaLayoutGuide.topAnchor, topConstant: 0.0, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, leadingConstant: 0.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlbumViewModel.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        cell.textLabel?.textColor = UIColor().HexToColor(hexString: "#50A3E3", alpha: 1)
        cell.textLabel?.font = UIFont(name: "AvenirNext", size: 15.0)
        let song = AlbumViewModel.songs[indexPath.row]
        cell.textLabel?.text = "\(song.trackNumber ?? 0). \(song.trackName ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AlbumHeader") as? AlbumTableViewHeader else {
            return UITableViewHeaderFooterView()
        }
        header.coverImageView.image = AlbumViewModel.image
        header.titleLabel.text = AlbumViewModel.title
        header.artistLabel.text = AlbumViewModel.artist
        header.genreYearLabel.text = "\(AlbumViewModel.genre ?? "") • \(AlbumViewModel.year ?? "")"
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160.0
    }
}
