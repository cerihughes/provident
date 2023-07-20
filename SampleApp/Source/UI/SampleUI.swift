//
//  SampleUI.swift
//  SampleApp
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Provident
import UIKit

class SampleUI {
    private let window: UIWindow
    private let registry: Registry<Navigation, Void>
    private let registrar: Registrar<Navigation, Void>

    init(window: UIWindow) {
        self.window = window
        registry = Registry()
        registrar = Registrar(registry: registry)
        registrar.resolve(resolver: SampleResolver())
    }

    func showInitialUI() -> Bool {
        Navigation.login.navigate(using: registry, from: nil, in: window)
    }
}
