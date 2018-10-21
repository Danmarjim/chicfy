//
//  MasterPresenter.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation

final class MasterPresenter: MasterPresenterBehaviorProtocol {
    var view: MasterViewBehaviorProtocol?
    var interactor: MasterInteractorBehaviorProtocol?
    var wireFrame: MasterWireframeBehaviorProtocol?
}

extension MasterPresenter: MasterViewProtocol {
    func updateTableView() {
        interactor?.requestPosts()
    }
    
//    func imageCollectionDidSelect(model: ImageCollectionCellModel) {
//        guard let view = view else { return }
//
//        wireFrame?.navigateToImageCollectionDetailModule(from: view, model: model)
//    }
}

extension MasterPresenter: MasterInteractorProtocol {
    func fetchPosts(response: [MasterCellModel]?, error: Error?) {
        guard let response = response else {
//            guard let view = view else { return }
//            //If the error is controlled.
//            if let error = error {
//                let issuesControlModel = IssuesControlModel(title: "imageCollection", buttonHidden: false, buttonTitle: "Retry", subtitle: error.localizedDescription)
//                wireFrame?.presentIssuesControlModule(from: view, model: issuesControlModel)
//            } else {
//                // Else we put a generic message in the error.
//                let issuesControlModel = IssuesControlModel(title: "imageCollection", buttonHidden: false, buttonTitle: "Retry", subtitle: "Something was wrong")
//                wireFrame?.presentIssuesControlModule(from: view, model: issuesControlModel)
//            }
            return
        }
        view?.viewDidReceiveUpdates(model: response)
    }
}
