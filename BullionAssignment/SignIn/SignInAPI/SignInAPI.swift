//
//  SignInAPI.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation
import RxSwift

protocol SignInAPI: ClientAPI {
    func requestSignIn(parameters: [String: Any]) -> Single<ResponseSignIn>
}
