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
        searchView.historyTableView.delegate = self
        
        view.addSubview(searchView)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        Constraints().constraintWithTopAndLeadingAnchor(field: searchView, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height, topAnchor: view.safeAreaLayoutGuide.topAnchor, topConstant: 0.0, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, leadingConstant: 0.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
