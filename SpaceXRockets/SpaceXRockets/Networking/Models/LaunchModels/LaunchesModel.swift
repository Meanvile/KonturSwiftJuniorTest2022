//
//  LaunchesModel.swift
//  SpaceXLaunch
//
//  Created by Sergey on 13.04.2022.
//

import Foundation

struct LaunchesModel: Decodable {
    let flightNumber: Int?
    let name: String?
    let details: String?
    let date: Date?
    let success: Bool?
    let links: LinkModel?
    let rocket: String?
    
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case name
        case details
        case date = "date_local"
        case success
        case links
        case rocket
    }
}
