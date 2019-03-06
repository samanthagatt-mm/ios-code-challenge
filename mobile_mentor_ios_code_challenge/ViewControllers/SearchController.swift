//
//  SearchController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var searchView: SearchView = { return SearchView() }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        // Creates sign out bar button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut))
        
        // Sets title on nav bar to user's email
        title = UserAccountViewModel.userEmail
        
        searchView.historyTableView.delegate = self
        searchView.historyTableView.dataSource = self
        searchView.historyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "HistoryCell")
        
        searchView.searchButton.addTarget(self, action: #selector(search(sender:)), for: .touchUpInside)
        
        view.addSubview(searchView)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        Constraints().constraintWithTopAndLeadingAnchor(field: searchView, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height, topAnchor: view.safeAreaLayoutGuide.topAnchor, topConstant: 0.0, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, leadingConstant: 0.0)
    }
    
    @objc func signOut() {
        dismiss(animated: true) {
            
        }
    }
    
    @objc func search(sender: UIButton) {
        let term = searchView.textField.text
        NetworkHelper.search(by: term ?? "") { [weak self] (success) in
            if success {
                self?.searchView.toggleHistoryTableViewVisibility()
                self?.searchView.historyTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchHistoryViewModel.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        
        cell.backgroundColor = .clear
        cell.textLabel?.text = SearchHistoryViewModel.history[indexPath.row].term
        cell.textLabel?.textColor = UIColor().HexToColor(hexString: "#0463AC", alpha: 1)
        
        // let dateFormatter = DateFormatter()
        // dateFormatter.dateFormat = "dd-MM-YYYY hh:mm:ss"
        // let dateString = dateFormatter.string(from: SearchHistoryViewModel.history[indexPath.row].date)
        // cell.detailTextLabel?.text = dateString
        // cell.detailTextLabel?.textColor = UIColor().HexToColor(hexString: "#0463AC", alpha: 1)
        
        return cell
    }
}
