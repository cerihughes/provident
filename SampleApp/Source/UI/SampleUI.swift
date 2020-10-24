//
//  SampleUI.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Provident
import UIKit

class SampleUI {
    private let window: UIWindow
    private let registry: Registry<Navigation, Void>
    private let registrar: Registrar<Navigation, Void>
    private let navigationController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
        registry = Registry()
        registrar = Registrar(registry: registry)
        registrar.resolve(resolver: SampleResolver())

        window.rootViewController = navigationController
    }

    func showInitialUI() -> Bool {
        guard let initialViewController = registry.createViewController(from: .login) else {
            return false
        }

        navigationController.pushViewController(initialViewController, animated: false)
        return true
    }
}
