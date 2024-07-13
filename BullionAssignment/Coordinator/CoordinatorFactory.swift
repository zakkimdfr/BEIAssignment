//
//  CoordinatorFactory.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation
import UIKit

protocol CoordinatorFactory {
    // MARK: - Auth
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthenticationCoordinatorOutput
    
    // MARK: - Menubar
//    func makeMenubarCoordinator() -> (configurator: Coordinator & MenubarCoordinatorOutput, toPresent: Presentable?)
    
//    // MARK: - Account
//    func makeAccountCoordinator(navController: UINavigationController?) -> (configurator: Coordinator & AccountCoordinatorOutput, toPresent: Presentable?)
//    func makeAccountCoordinator(router: Router) -> (configurator: Coordinator & AccountCoordinatorOutput, toPresent: Presentable?)
    
    
    // MARK: - Dashboard
//    func makeDashboardCoordinator(navController: UINavigationController?) -> (configurator: Coordinator & DashboardCoordinatorOutput, toPresent: Presentable?)
//    func makeDashboardCoordinator() -> (configurator: Coordinator & DashboardCoordinatorOutput, toPresent: Presentable?)
}
