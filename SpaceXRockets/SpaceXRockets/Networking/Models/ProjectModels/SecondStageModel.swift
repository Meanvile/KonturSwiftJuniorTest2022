//
//  SecondStageModel.swift
//  SpaceXRockets
//
//  Created by Sergey on 12.04.2022.
//

import Foundation

struct SecondStage: Decodable {
    let engines: Int
    let fuel_amount_tons: Float
    let burn_time_sec: Int?
}
