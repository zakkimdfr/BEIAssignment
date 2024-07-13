//
//  SignInRepository.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation
import RxSwift

protocol SignInRepository {
    func requestSignIn(signInRequest: SignInRequestModel) -> Single<SignInModel>
}

