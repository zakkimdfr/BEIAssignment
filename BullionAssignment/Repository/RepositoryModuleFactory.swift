//
//  RepositoryModuleFactory.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

protocol RepositoryModuleFactory {
    func makeSignInRepo() -> SignInRepository
}
