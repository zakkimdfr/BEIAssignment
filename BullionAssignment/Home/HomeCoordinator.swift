//
//  HomeCoordinator.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

class HomeCoordinator: BaseCoordinator, HomeCoordinatorOutput {
    var onAuthFlow: (() -> Void)?
    var onAuthFlowWithEntry: ((AuthEntry) -> Void)?
    
    
    private let router: Router
    private let factory: HomeFactory
    private let coordinatorFactory: CoordinatorFactory
    
    init(router: Router, factory: HomeFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
}
