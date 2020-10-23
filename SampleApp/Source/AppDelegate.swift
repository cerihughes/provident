//
//  AppDelegate.swift
//  App
//
//  Created by Ceri Hughes on 22/10/2020.
//

import Provident
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let registry = Registry<Navigation, Void>()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let registrar = Registrar(registry: registry)
        registrar.resolve(resolver: SampleResolver())

        guard let initialViewController = registry.createViewController(from: .login) else {
            return false
        }

        let window = UIWindow()
        window.rootViewController = UINavigationController(rootViewController: initialViewController)
        window.makeKeyAndVisible()

        self.window = window
        return true
    }
}
