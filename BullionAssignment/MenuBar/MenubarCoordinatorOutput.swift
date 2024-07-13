//
//  MenubarCoordinatorOutput.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

protocol MenubarCoordinatorOutput {
    var onAuthFlow: (() -> Void)? { get set }
    var onAuthFlowWithEntry: ((AuthEntry) -> Void)? { get set }
    var logout:(() -> Void)? { get set }
    var goDashboard:(() -> Void)? { get set }
}
