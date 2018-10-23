//
//  MasterInteractor.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation

final class MasterInteractor {
    var presenter: MasterInteractorProtocol?
    
    let apiClient = APIClient()
    var postModel: [Post]?
}

extension MasterInteractor: MasterInteractorBehaviorProtocol {
    func requestPosts() {
        apiClient.fetchPosts { response, error in
            if error == nil {
                if let elements = response?.count {
                    if elements > 0 {
                        self.postModel = response
                        let model = self.parsedDataModel()
                        self.presenter?.fetchPosts(response: model, error: nil)
                    } else {
                        self.presenter?.fetchPosts(response: nil, error: nil)
                    }
                }
            } else {
                self.presenter?.fetchPosts(response: nil, error: error)
            }
        }
    }
    
    func parsedDataModel() -> [ChicfyCellModel] {
        var mappedModel = [ChicfyCellModel]()
        if let postModel = postModel {
            mappedModel = postModel.map {
                return ChicfyCellModel(postId: $0.postId, title: "\($0.title)", body: "\($0.body)", comments: nil)
            }
        }
        return mappedModel
    }
}
