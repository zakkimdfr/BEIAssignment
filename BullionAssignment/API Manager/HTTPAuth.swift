//
//  HTTPAuth.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation

class HTTPAuth {
    static let shared = HTTPAuth()
    private init() {
        
    }
    var token: String? {
        if let token = self.token {
            return token
        }
        return nil
    }
    
    var bearerToken: String? {
        if let bearerToken = self.bearerToken {
            return bearerToken
        }
        return nil
    }
    
    enum tokenType {
        case basic
        case bearer
    }
}
