//
//  Service.swift
//  SpaceX
//
//  Created by Sergey on 12.04.2022.
//  Copyright © 2022 com.mycompany. All rights reserved.
//

import Foundation
import Alamofire
import Combine

final class Service {
    
    private let baseUrl: String = "https://api.spacexdata.com/v4/"
    private lazy var decoder: JSONDecoder = {
        var decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    public static let standart: Service = Service()
    
    func get<T: Decodable>(path: Endpoint, responseType: T.Type) -> AnyPublisher<T, ServiceError> {
        AF.request(self.baseUrl + path.rawValue, method: .get)
            .publishDecodable(type: responseType, decoder: self.decoder)
            .value()
            .mapError(ServiceError.init(error:))
            .eraseToAnyPublisher()
    }

}
