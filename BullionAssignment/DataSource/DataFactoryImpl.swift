//
//  DataFactoryImpl.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation

class ModuleFactoryImpl: DataModuleFactory {
    func makeBaseIdentifier() -> any HTTPIdentifier {
        return BaseIdentifier()
    }
    
    func makeHTTPClient() -> any HTTPClient {
        return HTTPClientImpl(identifier: makeBaseIdentifier())
    }
    
    func makeSignInAPI() -> any SignInAPI {
        return SingInAPIImpl(httpCliet: makeHTTPClient())
    }
    
    
}
