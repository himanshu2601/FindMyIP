//
//  Service.swift
//  FindMyIP
//
//  Created by himanshu.goyal@telusinternational.com on 08/02/24.
//

import Foundation
import Combine
import Alamofire

protocol ServiceProtocol{
    func fetchIPData() -> AnyPublisher<InfoModel, AFError>
}

class Service{
    static let shared = Service()
    private init(){}
}

extension Service: ServiceProtocol{
    func fetchIPData() -> AnyPublisher<InfoModel, AFError> {
        let url = URL(string: "https://ipapi.co/json/")!
        
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: InfoModel.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
