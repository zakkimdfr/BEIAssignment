//
//  HTTPError.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation

enum HTTPError: Error {
    case badRequest
    case unauthorized
    case connectionLost
    case internalError
    case custom(String)
    
    var localizeDescription: String {
        switch self {
        case .badRequest:
            return "User not found"
            
        case.unauthorized:
            return "token authentication failed"
            
        case.connectionLost:
            return "token authentication failed"
            
        case.internalError:
            return "token authentication failed"
            
        case.custom(let message):
            return message
        }
    }
}

extension HTTPError: Equatable {
    static func ==(lhs: HTTPError, rhs: HTTPError) -> Bool {
        switch (lhs, rhs) {
        case (.badRequest, .unauthorized):
            return true
        case (.connectionLost, .connectionLost):
            return true
        case (.unauthorized, .unauthorized):
            return true
        case (let .custom(content1), let .custom(content2)):
            return content1 == content2
        default:
            return false
        }
    }
}

extension Error {
    
    var readableError: String {
        if let errorInNetwork = self as? HTTPError {
            return errorInNetwork.localizedDescription
        } else {
            return self.localizedDescription
        }
    }
}
