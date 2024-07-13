//
//  Extension+UIViewController.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupHideKeyboardWhenTappedAround() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(UIViewController.dismissThisKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissThisKeyboard() {
        view.endEditing(true)
    }
    
    ///setup view button when active
    ///Corner radius 8
    ///Background color primary
    func setupActiveButton(button : UIButton){
        button.layer.cornerRadius = 8
        button.layer.backgroundColor = UIColor.white.cgColor
        button.setTitleColor(.white, for: .normal)
    }
    
    ///setup view button when deactive
    ///Corner radius 8
    ///Background color primary
    func setupDeactiveButton(button : UIButton){
        button.layer.cornerRadius = 8
        button.layer.backgroundColor = UIColor.black.cgColor
        button.setTitleColor(.white, for: .normal)
    }
    
    /// button active
    /// corner radius
    /// bordor color primary
    func setupSecondaryButton(button : UIButton){
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    func wrapInNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
    
    class func controllerFromStoryboard(_ storyboard: Storyboard) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
    }
}


public func dismissKeyboard() {
    UIApplication
        .shared
        .sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
}

enum Storyboard: String {
    case main = "Main"
    case login = "Login"
}

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

