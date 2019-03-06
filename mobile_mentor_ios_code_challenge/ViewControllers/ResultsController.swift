//
//  ResultsController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/6/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class ResultsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView = { return UITableView() }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        tableView.backgroundColor = UIColor().HexToColor(hexString: "#323F44", alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: "ResultCell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        Constraints().constraintWithTopAndLeadingAnchor(field: tableView, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height - 120, topAnchor: view.safeAreaLayoutGuide.topAnchor, topConstant: 0.0, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, leadingConstant: 0.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchResultViewModel.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? ResultTableViewCell else {
            return UITableViewCell()
        }
        
        NetworkHelper.getImage(urlString: SearchResultViewModel.results[indexPath.row].artworkUrl100 ?? "") { (image) in
            cell.coverImageView.image = image
            SearchResultViewModel.images[indexPath.row] = image
        }
        
        cell.songLabel.text = SearchResultViewModel.results[indexPath.row].trackName
        cell.albumLabel.text = SearchResultViewModel.results[indexPath.row].collectionName
        cell.artistLabel.text = SearchResultViewModel.results[indexPath.row].artistName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NetworkHelper.fetch(SearchResultViewModel.results[indexPath.row].collectionId ?? 0) { success in
            if success {
                AlbumViewModel.setImageNumber(indexPath.row)
                let viewController = AlbumController()
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        
    }
}
