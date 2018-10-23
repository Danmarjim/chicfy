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
    
    var detailModel: ChicfyCellModel?
    var detailModelResponse: ChicfyCellModel?
}

extension DetailPresenter: DetailViewProtocol {
    func updateView() {
        guard let detailModel = detailModel else { return }

        interactor?.requestComments(model: detailModel)
    }
    
    func addCommentButtonDidTap() {
        guard var detailModelResponse = detailModelResponse, let count = detailModelResponse.comments?.count  else { return }
        detailModelResponse.comments?.insert(Comment(postId: detailModelResponse.postId, commentId: count + 1, name: "Daniel Martin Jimenez", email: "danmarjim@gmail.com", body: "Comentario nuevo"), at: 0)
        
        view?.viewDidReceiveUpdates(model: detailModelResponse)
    }
}

extension DetailPresenter: DetailInteractorProtocol {
    func fetchComments(response: ChicfyCellModel?, error: Error?) {
        guard let response = response else { return }
        detailModelResponse = response
        
        view?.viewDidReceiveUpdates(model: response)
    }
}
