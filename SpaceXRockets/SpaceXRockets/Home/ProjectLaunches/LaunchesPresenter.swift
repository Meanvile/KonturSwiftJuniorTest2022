//
//  LaunchesPresenter.swift
//  SpaceXLaunch
//
//  Created by Sergey on 13.04.2022.
//

import Foundation

struct LaunchesPresenter: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let date: String
    let success: Bool
    let rocket: String
    
    init(with model: LaunchesModel) {
        self.image = model.links?.patch.small ?? ""
        self.name = model.name ?? ""
        
        if let date = model.date {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat  = "dd MMMM, yyyy"
            self.date = dateFormatter.string(from: date)
        } else {
            self.date = ""
        }
        self.success = model.success ?? true
        self.rocket = model.rocket ?? ""
    }
}
