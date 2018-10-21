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
                        // There are elements to show.
                        self.presenter?.fetchPosts(response: model, error: nil)
                    } else {
                        // The request was correctly executed but there are no elements to show.
                        self.presenter?.fetchPosts(response: nil, error: nil)
                    }
                }
            } else {
                self.presenter?.fetchPosts(response: nil, error: error)
            }
        }
    }
    
    func parsedDataModel() -> [MasterCellModel] {
        var mappedModel = [MasterCellModel]()
        if let postModel = postModel {
            for item in postModel {
                mappedModel.append(MasterCellModel(title: item.title, body: item.body))
            }
        }
        return mappedModel
    }
}
