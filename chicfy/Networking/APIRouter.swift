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
    case fetchComments(postId: Int)
    case addComment()
    
    //MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .fetchPosts:
            return .get
        case .fetchComments:
            return .get
        case .addComment():
            return .post
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .fetchPosts():
            return "/posts/"
        case .fetchComments(let postId):
            return "/comments?postId=\(postId)"
        case .addComment():
            return "/comments"
        }
    }
    
    // MARK: - URLStringRequest
    func asURLString() -> String {
        return APIConstants.baseURL.rawValue + path
    }
}
