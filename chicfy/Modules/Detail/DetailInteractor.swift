//
//  DetailInteractor.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation

//"Interactor": It contains the business logic. 
final class DetailInteractor {
    var presenter: DetailInteractorProtocol?
    
    let apiClient = APIClient()
    var commentModel: [Comment]?
}

extension DetailInteractor: DetailInteractorBehaviorProtocol {
    func requestComments(model: ChicfyCellModel) {
        apiClient.fetchComments(postId: model.postId) { response, error in
            if error == nil {
                if let elements = response?.count {
                    if elements > 0 {
                        self.commentModel = response
                        let model = self.parsedDataModel(fromModel: model)
                        self.presenter?.fetchComments(response: model, error: nil)
                    } else {
                        self.presenter?.fetchComments(response: nil, error: nil)
                    }
                }
            } else {
                self.presenter?.fetchComments(response: nil, error: error)
            }
        }
    }
    
    func parsedDataModel(fromModel: ChicfyCellModel) -> ChicfyCellModel {
        return ChicfyCellModel(postId: fromModel.postId, title: fromModel.title, body: fromModel.body, comments: commentModel)
    }
}
