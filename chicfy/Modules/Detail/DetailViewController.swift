//
//  DetailViewController.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var descriptionPost: UILabel!
    
    var presenter: DetailViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.updateView()
    }
    
    private func setupLayout() {
        titlePost.font = Style.fontTitlePost
        descriptionPost.font = Style.fontDescriptionPost
    }
}

extension DetailViewController: DetailViewBehaviorProtocol {
    func viewDidReceiveUpdates(model: MasterCellModel) {
        titlePost.text = model.title
        descriptionPost.text = model.body
    }
}


