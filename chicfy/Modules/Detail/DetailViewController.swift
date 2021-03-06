//
//  DetailViewController.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation
import UIKit

//"View": This layer "print" data from presenter and ask to presenter what to do related with user's inputs.
final class DetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var descriptionPost: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var addCommentButton: UIButton!
    
    var presenter: DetailViewProtocol?
    fileprivate var chicfyCellModel: ChicfyCellModel?
    private let kRowHeight: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupTableView()
        presenter?.updateView()
    }
    
    private func setupLayout() {
        title = "Detail"
        commentLabel.text = "Comentarios"
        
        titlePost.font = Style.fontTitlePost
        descriptionPost.font = Style.fontDescriptionPost
    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = kRowHeight
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @IBAction func controlButtonDidTap(_ sender: Any) {
        presenter?.addCommentButtonDidTap()
    }
}

extension DetailViewController: DetailViewBehaviorProtocol {
    func viewDidReceiveUpdates(model: ChicfyCellModel) {
        titlePost.text = model.title
        descriptionPost.text = model.body
        
        chicfyCellModel = model
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let comments = chicfyCellModel?.comments {
            return comments.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChicfyCell", for: indexPath) as? ChicfyCell else { return UITableViewCell() }

        if let chicfyCellModel = chicfyCellModel, let comments = chicfyCellModel.comments {
            cell.title.text = comments[indexPath.row].name
            cell.title.font = Style.fontTitlePost

            cell.body.text = comments[indexPath.row].body
            cell.body.font = Style.fontDescriptionPost
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

