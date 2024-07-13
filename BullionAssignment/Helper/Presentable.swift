//
//  Presentable.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 12/07/24.
//

import Foundation
import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
