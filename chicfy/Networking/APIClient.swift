//
//  APIClient.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation
import Alamofire

final class APIClient {
    var sessionManager = SessionManager()
    
    func fetchPosts(completion: @escaping (_ entity: ([Post]?), _ error: Error?) -> Void) {
        sessionManager.request(APIRouter.fetchPosts().asURLString()).validate().responseData { response in
            switch response.result {
            case .success:
                if let jsonData = response.result.value {
                    let jsonDecoder = JSONDecoder()
                    guard let data = try? jsonDecoder.decode([Post].self, from: jsonData) else { return }
                    completion(data, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
