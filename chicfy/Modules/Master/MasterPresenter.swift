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
    
    func postMasterDidSelect(model: ChicfyCellModel) {
        guard let view = view else { return }

        wireFrame?.navigateToDetailModule(from: view, model: model)
    }
}

extension MasterPresenter: MasterInteractorProtocol {
    func fetchPosts(response: [ChicfyCellModel]?, error: Error?) {
        guard let response = response else { return }
        
        view?.viewDidReceiveUpdates(model: response)
    }
}
