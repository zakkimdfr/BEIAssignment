//
//  AuthenticationCoordinatorOutput.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

protocol AuthenticationCoordinatorOutput {
    var onMenubarFlow: (() -> Void)? { get set }
    var onMenuBarFlowCallCenter: ((Int) -> Void)? { get set }
    var onCloseFromSwitchAcc:(() -> Void)?{ get set}
}
