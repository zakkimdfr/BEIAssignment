//
//  AppDelegate.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 10/07/24.
//

import UIKit
import Wormholy
import IQKeyboardManagerSwift

@available(iOS 13.4, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Wormholy.shakeEnabled = true
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: SignInViewController())
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
    
    private func makeCoordinator() -> Coordinator {
        return AppCoordinator(
            router: RouterImpl(rootController: self.rootController),
            coordinatorFactory: CoordinatorFactoryImpl()
        )
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

