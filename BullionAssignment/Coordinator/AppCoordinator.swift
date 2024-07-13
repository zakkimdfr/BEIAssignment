//
//  AppCoordinator.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

fileprivate enum LaunchInstructor {
    case login, dashboard
    
    static func configure() -> LaunchInstructor {
        return .dashboard
    }
}

final class AppCoordinator: BaseCoordinator {
    
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start(with option: DeepLinkOption?, indexTab selectTab: SelectedTabEntry?) {
        //start with deepLink
        if let option = option {
            self.startWith(deeplink: option)
        } else {
            self.startBasicFlow()
        }
    }
    
    private func startWith(deeplink: DeepLinkOption) {
        switch deeplink {
        case .test:
            if let coordinator = childCoordinators.first {
                self.runAuthFlow(with: deeplink)
                self.router.dismissModule()
                self.removeDependency(coordinator)
            }
        }
    }
    
    private func startBasicFlow() {
        switch self.instructor {
        case .dashboard:
            self.runAuthFlow()
//            self.runMenubarFlow()
        case .login:
            self.runAuthFlow()
        }
    }
    
    private func runAuthFlow(with option: DeepLinkOption? = nil) {
        var coordinator = coordinatorFactory.makeAuthCoordinator(router: self.router)
        coordinator.onMenubarFlow = { [weak self] in
            guard let self = self else { return }
//            self.runMenubarFlow()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runAuthFlow(entry: AuthEntry) {
        var coordinator = coordinatorFactory.makeAuthCoordinator(router: self.router)
        coordinator.onMenubarFlow = { [weak self] in
            guard let self = self else { return }
//            self.runMenubarFlow()
            self.removeDependency(coordinator)
        }
        
        coordinator.onCloseFromSwitchAcc = { [weak self] in
            guard let self = self else { return }
//            self.runMenubarFlow()
            self.removeDependency(coordinator)
        }
    
        addDependency(coordinator)
        coordinator.start(auth: entry)
    }
    
//    private func runMenubarFlow(with option: DeepLinkOption? = nil) {
//        var (coordinator, module) = coordinatorFactory.makeMenubarCoordinator()
//        coordinator.logout = { [weak self] in
//            guard let self  = self else { return }
//            self.runMenubarFlow()
//        }
//        coordinator.onAuthFlow = { [weak self] in
//            guard let self = self else { return }
//            self.runAuthFlow()
////            self.runMenubarFlow()
//            self.removeDependency(coordinator)
//        }
//        
//        coordinator.onAuthFlowWithEntry = {[weak self] (entry) in
//            guard let self = self else { return }
//            self.runAuthFlow(entry: entry)
//            self.removeDependency(coordinator)
//        }
//    
//        addDependency(coordinator)
//        router.setRootModule(module, hideBar: true, animation: .bottomUp)
//        coordinator.start(with: option, indexTab: .tabIndex(5))
//    }
}

