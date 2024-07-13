//
//  DataModuleFactory.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

protocol DataModuleFactory {
    // MARK: - HTTP Client
    func makeBaseIdentifier() -> HTTPIdentifier
    func makeHTTPClient() -> HTTPClient
    
    func makeSignInAPI() -> SignInAPI
}
