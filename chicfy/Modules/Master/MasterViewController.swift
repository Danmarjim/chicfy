//
//  MasterViewController.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import UIKit

final class MasterViewController: UITableViewController {
    var presenter: MasterViewProtocol?
    fileprivate var chicfyCellModel: [ChicfyCellModel]?
    private let kRowHeight: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupTableView()
        presenter?.updateTableView()
    }
    
    private func setupLayout() {
        title = "Master"
    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = kRowHeight
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension MasterViewController: MasterViewBehaviorProtocol {
    func viewDidReceiveUpdates(model: [ChicfyCellModel]) {
        chicfyCellModel = model
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension MasterViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chicfyCellModel?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChicfyCell", for: indexPath) as? ChicfyCell else { return UITableViewCell() }
        
        if let chicfyCellModel = chicfyCellModel {
            cell.title.text = chicfyCellModel[indexPath.row].title
            cell.title.font = Style.fontTitlePost
            
            cell.body.text = chicfyCellModel[indexPath.row].body
            cell.body.font = Style.fontDescriptionPost
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

// MARK: - UITableViewDelegate
extension MasterViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let chicfyCellModel = chicfyCellModel else { return }
        presenter?.postMasterDidSelect(model: chicfyCellModel[indexPath.row])
    }
}
