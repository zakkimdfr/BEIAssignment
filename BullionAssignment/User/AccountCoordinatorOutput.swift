//
//  AccountCoordinatorOutput.swift
//  BullionAssignment
//
//  Created byZakki Mudhoffar on 13/07/24.
//

import Foundation

protocol AccountCoordinatorOutput {
    var onAuthFlow: (() -> Void)? { get set }
    var onLogout: (() -> Void)? { get set }
}
