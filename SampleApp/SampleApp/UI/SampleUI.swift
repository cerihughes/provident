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
    private let registrar: Registrar<Navigation, Void>

    init(window: UIWindow) {
        self.window = window
        registrar = Registrar()
        registrar.resolve(resolver: SampleResolver())
    }

    func showInitialUI() -> Bool {
        Navigation.login.navigate(using: registrar.registry, from: nil, in: window)
    }
}
