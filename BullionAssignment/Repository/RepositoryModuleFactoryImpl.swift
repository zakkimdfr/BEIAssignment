//
//  RepositoryModuleFactoryImpl.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

extension ModuleFactoryImpl: RepositoryModuleFactory {
    func makeSignInRepo() -> any SignInRepository {
        return SignInRepositoryImpl(signInAPI: self.makeSignInAPI())
    }
}
