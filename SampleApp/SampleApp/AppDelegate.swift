//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Ceri Hughes on 22/10/2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var ui: SampleUI!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow()
        ui = SampleUI(window: window)
        window.makeKeyAndVisible()
        do {
            try ui.showInitialUI()
            return true
        } catch {
            return false
        }
    }
}
