//
//  RocketsModel.swift
//  SpaceXRockets
//
//  Created by Sergey on 12.04.2022.
//

import Foundation

struct Rocket: Decodable {
    let height: Height
    let diameter: Height
    let mass: Mass
    let first_stage: FirstStage
    let second_stage: SecondStage
    let payload_weights: [PayloadWeights]
    let flickr_images: [String]
    let name: String
    let type: String
    let cost_per_launch: Int
    let success_rate_pst: Int?
    let first_flight: String?
    let country: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case height
        case diameter
        case mass
        case first_stage
        case second_stage
        case payload_weights
        case flickr_images
        case name
        case type
        case cost_per_launch
        case success_rate_pst
        case first_flight
        case country
        case id
    }
}

