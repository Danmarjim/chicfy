//
//  DetailPresenter.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation

final class DetailPresenter: DetailPresenterBehaviorProtocol {
    var view: DetailViewBehaviorProtocol?
    var interactor: DetailInteractorBehaviorProtocol?
    var wireFrame: DetailWireframeBehaviorProtocol?
    
    var detailModel: MasterCellModel?
}

extension DetailPresenter: DetailViewProtocol {
    func updateView() {
        guard let detailModel = detailModel else { return }

        interactor?.requestComments(model: detailModel)
    }
}

extension DetailPresenter: DetailInteractorProtocol {
    func fetchComments(response: MasterCellModel?, error: Error?) {
        guard let response = response else { return }
        
        view?.viewDidReceiveUpdates(model: response)
    }
}
