//
//  HTTPClient.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation
import RxSwift

protocol ClientAPI {
    var httpClient: HTTPClient {
        get
    }
}

protocol HTTPClient {
    func sent<T: Codable>(request apiRequest: HTTPRequest) -> Single<T>
    func verify() -> Completable
}


protocol HTTPIdentifier {
    var baseUrl: URL {
        get
    }
}

class BaseIdentifier: HTTPIdentifier {
    #if DEBUG //development
    var baseUrl = URL(string: "https://api-test.bullionecosystem.com")!
    #else //production
    var baseUrl = URL(string: "https://api-test.bullionecosystem.com")!
    #endif
}
