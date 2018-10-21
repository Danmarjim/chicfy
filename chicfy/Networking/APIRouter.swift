//
//  APIRouter.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter {
    case fetchPosts()
    case fetchComments(postId: String)
    
    //MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .fetchPosts:
            return .get
        case .fetchComments:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .fetchPosts():
            return "/posts/"
        case .fetchComments(let postId):
            return "/comments?postId=\(postId)"
        }
    }
    
    // MARK: - URLStringRequest
    func asURLString() -> String {
        return APIConstants.baseURL.rawValue + path
    }
}
