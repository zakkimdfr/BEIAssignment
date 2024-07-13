//
//  AuthenticatonFactoryImpl.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

@available(iOS 13.4, *)
extension ModuleFactoryImpl: AuthenticationFactory {
    func makeSignIn() -> SignInView {
        let vc = SignInViewController()
        vc.viewModel = makeSignInVM()
        return vc
    }
    
    
}
