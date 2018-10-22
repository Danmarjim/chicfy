//
//  DetailInteractor.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation

final class DetailInteractor {
    var presenter: DetailInteractorProtocol?
    
    let apiClient = APIClient()
    var commentModel: [Comment]?
}

extension DetailInteractor: DetailInteractorBehaviorProtocol {
    func requestComments(model: MasterCellModel) {
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
    
    func addComment() {
        apiClient.addComment { error in
            if error == nil {
                //
            } else {
                //self.presenter.a
            }
        }
    }
    
    func parsedDataModel(fromModel: MasterCellModel) -> MasterCellModel {
        return MasterCellModel(postId: fromModel.postId, title: fromModel.title, body: fromModel.body, comments: commentModel)
    }
}
