//
//  DeepLinkOption.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

struct DeepLinkURLConstants {
    static let test = "TEST"
}

enum DeepLinkOption: String {
    
    case test = "TEST"
    
    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
        guard let id = dict?["messageType"] as? String else { return nil }
        
        switch id {
        case DeepLinkURLConstants.test: return .test
        default: return nil
        }
    }
}
