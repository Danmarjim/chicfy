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
    
    func viewDidReceiveUpdates(model: ChicfyCellModel)
}

protocol DetailViewProtocol {
    func updateView()
    func addCommentButtonDidTap()
}

protocol DetailInteractorBehaviorProtocol {
    var presenter: DetailInteractorProtocol? { get set }
    
    func requestComments(model: ChicfyCellModel)
}

protocol DetailInteractorProtocol {
    func fetchComments(response: ChicfyCellModel?, error: Error?)
}

protocol DetailPresenterBehaviorProtocol {
    var view: DetailViewBehaviorProtocol? { get set }
    var interactor: DetailInteractorBehaviorProtocol? { get set }
    var wireFrame: DetailWireframeBehaviorProtocol? { get set }
    var detailModel: ChicfyCellModel? { get set }
}

protocol DetailWireframeBehaviorProtocol {
    static func setupModule(detailModel: ChicfyCellModel) -> UIViewController?
}
