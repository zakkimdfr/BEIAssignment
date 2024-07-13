//
//  SingInnAPIImpl.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation
import RxSwift

class SingInAPIImpl: SignInAPI {
    private class PostSignIn: HTTPRequest {
        var method = HTTPMethod.POST
        var endPoint = "auth/login"
        var parameter: [String : Any]
        var authentication = HTTPAuth.tokenType.basic
        var header = HeaderType.basic
        
        init(parameters: [String: Any]) {
            self.parameter = parameters
        }
    }
    
    let httpClient: HTTPClient
    
    init(httpCliet: HTTPClient) {
        self.httpClient = httpCliet
    }
    
    func requestSignIn(parameters: [String : Any]) -> Single<ResponseSignIn> {
        return httpClient.sent(request: PostSignIn(parameters: parameters))
    }
}
