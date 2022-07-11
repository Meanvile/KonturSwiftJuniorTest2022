//
//  PayloadWeightsModel.swift
//  SpaceXRockets
//
//  Created by Sergey on 12.04.2022.
//

import Foundation

struct PayloadWeights: Decodable {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
}
