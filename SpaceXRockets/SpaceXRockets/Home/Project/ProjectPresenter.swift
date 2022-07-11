//
//  ProjectPresenter.swift
//  SpaceXRockets
//
//  Created by Sergey on 12.04.2022.
//

import Foundation

struct ProjectPresenter: Identifiable {
    
    let id = UUID()
    let height: Height
    let diameter: Height
    let mass: Mass
    let firstStage: FirstStage
    let secondStage: SecondStage
    let payload: [PayloadWeights]
    let images: String 
    let name: String
    let type: String
    let costPerLaunch: String
    let successRatePst: Int?
    let firstFlight: String
    let country: String
    let idRocket: String
    
    init(with model: Rocket) {
        self.height = model.height
        self.diameter = model.diameter
        self.mass = model.mass
        self.firstStage = model.first_stage
        self.secondStage = model.second_stage
        self.payload = model.payload_weights
        self.images = model.flickr_images.first ?? ""
        self.name = model.name
        self.type = model.type
        self.costPerLaunch = String(format: "%.1f", Float(model.cost_per_launch) / 1000000)
        self.successRatePst = model.success_rate_pst ?? 0
        if let firstFlight = model.first_flight {
            let months = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентрября", "октября", "ноября", "декабря"]
            let nums = firstFlight.components(separatedBy: "-")
            let trimmedMonth = Int(nums[1].replacingOccurrences(of: "^0+", with: "", options: .regularExpression))
            let date = "\(nums[2]) \(months[trimmedMonth! - 1]), \(nums[0])"
            self.firstFlight = date
        } else {
            self.firstFlight = ""
        }
        self.country = model.country
        self.idRocket = model.id
    }
}
