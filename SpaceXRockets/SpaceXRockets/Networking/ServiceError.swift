//
//  ServiceError.swift
//  SpaceX
//
//  Created by Sergey on 12.04.2022.
//  Copyright © 2022 com.mycompany. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceError: Error {
    case network
    
    init(error: AFError) {
        self = .network
    }
}
