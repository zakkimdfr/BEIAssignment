//
//  AuthenticationFactory.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

protocol AuthenticationFactory {
    func makeSignIn() -> SignInView
}
