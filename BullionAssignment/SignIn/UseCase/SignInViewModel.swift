//
//  SignInViewModel.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation
import RxSwift
import RxCocoa

class SignInViewModel: BaseViewModel {
    private let repository: SignInRepository
    private let disposeBag = DisposeBag()
    private let stateRelay = BehaviorRelay<BasicUIState>(value: .loading)
    private let signIRelay = BehaviorRelay<SignInModel?>(value: nil)
    
    init(repository: SignInRepository) {
        self.repository = repository
    }
    
    struct Input {
        let signInRequest: Observable<SignInRequestModel?>
        let viewDidLoadRelay: Observable<Void>
    }
    
    struct Output {
        let state: Driver<BasicUIState>
        let signinOutput: Driver<SignInModel?>
    }
    
    func transform(_ input: Input) -> Output {
        self.makeLogin(input)
        return Output(
            state: self.stateRelay.asDriver().skip(1),
            signinOutput: self.signIRelay.asDriver().skip(1)
        )
    }
    
    private func makeLogin(_ input: Input) {
        input.signInRequest
            .compactMap { $0 }
            .subscribe(
                onNext: { [weak self] body in
                    guard let self = self else { return }
                    self.requestSignIn(body: body)
                    self.stateRelay.accept(.loading)
                },
                onError: { [weak self] error in
                    self?.stateRelay.accept(.failure(error.readableError))
                }
            )
            .disposed(by: self.disposeBag)
    }
    
    private func requestSignIn(body: SignInRequestModel) {
        self.repository.requestSignIn(signInRequest: body)
            .subscribe(
                onSuccess: { [weak self] result in
                    self?.stateRelay.accept(.success("berhasil"))
                    self?.signIRelay.accept(result)
                },
                onFailure: { [weak self] error in
                    self?.stateRelay.accept(.failure(error.readableError))
                }
            )
            .disposed(by: self.disposeBag)
    }
}

