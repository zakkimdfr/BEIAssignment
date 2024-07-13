//
//  BaseView.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 12/07/24.
//

import Foundation

protocol BaseView: NSObjectProtocol, Presentable, Bindable { }
protocol Bindable {
    func bindViewModel()
}
