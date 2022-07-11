//
//  LaunchesViewModel.swift
//  SpaceXLaunch
//
//  Created by Sergey on 13.04.2022.
//

import Foundation
import Combine

final class LaunchesViewModel: NSObject, ObservableObject {
    private var task: Cancellable? = nil
    private var launches: [LaunchesModel] = []
    @Published var presenters: [LaunchesPresenter] = []
    
    func onAppear() {
        self.task = Service.standart.get(path: .launches,  responseType: [LaunchesModel].self)
            .map{[weak self] in
                self?.launches = $0
                return $0.map{ LaunchesPresenter( with: $0 ) }}
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] presenters in  self?.presenters = presenters
            })
    }
}
