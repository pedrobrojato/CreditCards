//
//  AppDelegate.swift
//  CreditCards
//
//  Created by Pedro Brojato on 02/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = CreditCardsViewController(nibName: nil, bundle: nil)
        let navigation = UINavigationController.init(rootViewController: viewController)
        navigation.navigationBar.prefersLargeTitles = true
        window = UIWindow()
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}

