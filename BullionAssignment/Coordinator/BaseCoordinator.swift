//
//  BaseCoordinator.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        start(with: nil, indexTab: nil)
    }
    
    func start(auth with: AuthEntry) { }
    func start(with option: DeepLinkOption?, indexTab with: SelectedTabEntry?) { }
    func start(consultation with: ConsultationModeEntry) { }
    func start(booking with: BookingModeEntry) { }
    func start(payment with: String) { }
    func start(family with: FamilyModeEntry) { }
    
    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeDependency($0) })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
