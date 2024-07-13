//
//  VMModuleFactoryImpl.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

extension ModuleFactoryImpl: VMModuleFactory {
    func makeSignInVM() -> SignInViewModel {
        return SignInViewModel(repository: self.makeSignInRepo())
    }
}
