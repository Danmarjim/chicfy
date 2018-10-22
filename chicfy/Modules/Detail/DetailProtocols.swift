//
//  DetailProtocols.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewBehaviorProtocol {
    var presenter: DetailViewProtocol? { get set }
    
    func viewDidReceiveUpdates(model: MasterCellModel)
}

protocol DetailViewProtocol {
    func updateView()
}

protocol DetailInteractorBehaviorProtocol {
    var presenter: DetailInteractorProtocol? { get set }
    
    func requestComments(model: MasterCellModel)
}

protocol DetailInteractorProtocol {
    func fetchComments(response: MasterCellModel?, error: Error?)
}

protocol DetailPresenterBehaviorProtocol {
    var view: DetailViewBehaviorProtocol? { get set }
    var interactor: DetailInteractorBehaviorProtocol? { get set }
    var wireFrame: DetailWireframeBehaviorProtocol? { get set }
    var detailModel: MasterCellModel? { get set }
}

protocol DetailWireframeBehaviorProtocol {
    static func setupModule(detailModel: MasterCellModel) -> UIViewController?
}
