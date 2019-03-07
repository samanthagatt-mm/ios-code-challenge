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
        searchView.historyTableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryCell")
        searchView.historyTableView.register(HistoryTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "HistoryHeader")
        
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
                self?.searchView.showHistory()
                self?.searchView.historyTableView.reloadData()
                let viewController = ResultsController()
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchHistoryViewModel.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.termLabel.text = SearchHistoryViewModel.history[indexPath.row].term
        cell.setDate(SearchHistoryViewModel.history[indexPath.row].date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NetworkHelper.search(by: SearchHistoryViewModel.history[indexPath.row].term) { [weak self] (success) in
            if success {
                self?.searchView.historyTableView.reloadData()
                let viewController = ResultsController()
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = searchView.historyTableView.dequeueReusableHeaderFooterView(withIdentifier: "HistoryHeader") as? HistoryTableViewHeader else { return UITableViewHeaderFooterView() }
        header.clearButton.addTarget(self, action: #selector(clearHistory(sender:)), for: .touchUpInside)
        return header
    }
    
    @objc func clearHistory(sender: UIButton) {
        SearchHistoryViewModel.clearHistory()
        searchView.hideHistory()
        searchView.historyTableView.reloadData()
    }
}
