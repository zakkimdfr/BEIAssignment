//
//  ResponseSignIn.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation

struct ResponseSignIn: Codable {
    let status: Int?
    let iserror: Bool?
    let message: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let name, email, token: String
}
