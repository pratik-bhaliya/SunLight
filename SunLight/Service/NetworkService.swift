//
//  NetworkService.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 29/8/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import Foundation
import Moya

let api = "d8b40396951045f865c3ae65c32e097a"

enum NetworkService {
    case forecast(Double,Double,String)
}

extension NetworkService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.darksky.net/forecast")!
    }
    
    var path: String {
        switch self {
        case let .forecast(lat, long, api):
            return "/\(api)/\(lat),\(long)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .forecast:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .forecast:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
