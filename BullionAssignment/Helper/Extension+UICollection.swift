//
//  Extension+UICollectio.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import UIKit

extension UICollectionView {
    func registerNIBForCell(with cellClass: AnyClass) {
        let className = String(describing: cellClass)
        self.register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }
    
    func dequeueCell<T>(with cellClass: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath) as? T
    }
}
