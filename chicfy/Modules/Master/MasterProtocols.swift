//
//  MasterProtocols.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation
import UIKit

protocol MasterViewBehaviorProtocol {
    var presenter: MasterViewProtocol? { get set }
    
    func viewDidReceiveUpdates(model: [ChicfyCellModel])
}

protocol MasterViewProtocol {
    func updateTableView()
    func postMasterDidSelect(model: ChicfyCellModel)
}

protocol MasterInteractorBehaviorProtocol {
    var presenter: MasterInteractorProtocol? { get set }
    
    func requestPosts()
}

protocol MasterInteractorProtocol {
    func fetchPosts(response: [ChicfyCellModel]?, error: Error?)
}

protocol MasterPresenterBehaviorProtocol {
    var view: MasterViewBehaviorProtocol? { get set }
    var interactor: MasterInteractorBehaviorProtocol? { get set }
    var wireFrame: MasterWireframeBehaviorProtocol? { get set }
}

protocol MasterWireframeBehaviorProtocol {
    static func setupModule() -> UIViewController?
    func navigateToDetailModule(from view: MasterViewBehaviorProtocol, model: ChicfyCellModel)
}
