//
//  ProjectViewModel.swift
//  SpaceXRockets
//
//  Created by Sergey on 12.04.2022.
//

import Foundation
import Combine

final class ProjectViewModel: NSObject, ObservableObject {
    
    private var task: Cancellable? = nil
    private var rockets: [Rocket] = []
    @Published var presenters: [ProjectPresenter] = []
    @Published var selectedRocketId: String = ""
    @Published var selectedRocketName: String = ""
    @Published var userDefaults: UserDefaults = UserDefaults.standard
    @Published var navigateToDetail: Bool = false
    @Published var navigateToSettings: Bool = false
    
    
    func onAppear() {
        self.task = Service.standart.get(path: .rockets, responseType: [Rocket].self)
            .map{ [weak self] in
                self?.rockets = $0
                return $0.map{ ProjectPresenter(with: $0) }
            }
            .sink(receiveCompletion: { _ in }, receiveValue: {[weak self] (presenters) in
                self?.presenters = presenters
            })
    }
    
    func itemSelected(at id: String, name: String) {
        self.selectedRocketId = id
        self.selectedRocketName = name 
        self.navigateToDetail = true
    }
    
    func settingsNavigation() {
        self.navigateToSettings = true
    }
}
