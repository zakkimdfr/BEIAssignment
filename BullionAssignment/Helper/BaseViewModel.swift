//
//  BaseViewModel.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation
import RxSwift

protocol BaseViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
