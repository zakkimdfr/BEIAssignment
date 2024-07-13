//
//  SignInRepositoryImpl.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation
import RxSwift

class SignInRepositoryImpl: SignInRepository {
    let disposeBag = DisposeBag()
    let signInAPI: SignInAPI
    
    init(signInAPI: SignInAPI) {
        self.signInAPI = signInAPI
    }
    
    func requestSignIn(signInRequest: SignInRequestModel) -> Single<SignInModel> {
        return Single.create { (observer) in
            self.signInAPI.requestSignIn(parameters: signInRequest.dictionary ?? [String: Any]())
                .catch { (error) ->
                    PrimitiveSequence<SingleTrait, ResponseSignIn> in
                    if (error as? HTTPError) == HTTPError.internalError {
                        return self
                            .signInAPI
                            .httpClient
                            .verify()
                            .andThen(
                                self.signInAPI.requestSignIn(
                                    parameters: signInRequest.dictionary ?? [String:Any]()
                                )
                            )
                    }
                    return Single.error(error)
                }
                .map { self.getSignResponse($0) }
                .subscribe(onSuccess: { (result) in
                    switch result {
                    case .success(let model) :
//                        print("\(model)")
                        observer(.success(model))
                    case .failure(let error) :
                        observer(.failure(error))
                    }
                }, onFailure: { (error) in
                    observer(.failure(error))
                }).disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    func getSignResponse(_ response: ResponseSignIn) -> Result<SignInModel, HTTPError> {
        if let status = response.status {
            if let data = response.data, status == 200 {
                let signInResponse = SignInModel(
                    name: data.name,
                    email: data.email,
                    token: data.token
                )
                return .success(signInResponse)
            }
        }
        return .failure(HTTPError.custom(response.message ?? ""))
    }
}
