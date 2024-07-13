//
//  AuthenticationCoordinator.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

class AuthenticationCoordinator: BaseCoordinator, AuthenticationCoordinatorOutput {
    var onMenubarFlow: (() -> Void)?
    var onMenuBarFlowCallCenter: ((Int) -> Void)?
    var onCloseFromSwitchAcc: (() -> Void)?
    
    private let router: Router
    private let factory: AuthenticationFactory
    
    init(router: Router, factory: AuthenticationFactory) {
        self.router = router
        self.factory = factory
    }
    
}
