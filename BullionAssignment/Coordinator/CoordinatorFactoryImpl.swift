//
//  CoordinatorFactoryImpl.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation
import UIKit

class CoordinatorFactoryImpl: CoordinatorFactory {
    
    // MARK: - Auth
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthenticationCoordinatorOutput {
        return AuthenticationCoordinator(router: router, factory: ModuleFactoryImpl())
    }
    
    // MARK: - Menubar
//    func makeMenubarCoordinator() -> (configurator: Coordinator & MenubarCoordinatorOutput, toPresent: Presentable?) {
//        let controller = TabbarController.controllerFromStoryboard(.main)
//        let coordinator = MenubarCoordinator(tabbarView: controller, coordinatorFactory: CoordinatorFactoryImpl())
//        return (coordinator, controller)
//    }
    
    
    // MARK: - Dashboard
//    func makeDashboardCoordinator(navController: UINavigationController?) -> (configurator: Coordinator & DashboardCoordinatorOutput, toPresent: Presentable?) {
//        let router = self.router(navController)
//        let coordinator = DashboardCoordinator(router: router, factory: ModuleFactoryImpl(), coordinatorFactory: CoordinatorFactoryImpl())
//        return (coordinator, router)
//    }
    
//    func makeDashboardCoordinator() -> (configurator: Coordinator & DashboardCoordinatorOutput, toPresent: Presentable?) {
//        return makeDashboardCoordinator(navController: nil)
//    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImpl(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return UINavigationController.controllerFromStoryboard(.main)
        }
    }
    
}
