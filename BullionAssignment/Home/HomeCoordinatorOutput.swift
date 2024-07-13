//
//  HomeCoordinatorOutput.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

protocol HomeCoordinatorOutput {
    var onAuthFlow: (() -> Void)? { get set }
    var onAuthFlowWithEntry: ((AuthEntry) -> Void)? { get set }
}
