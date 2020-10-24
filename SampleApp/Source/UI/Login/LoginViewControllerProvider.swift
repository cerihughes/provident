//
//  LoginViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import Provident
import UIKit

class LoginViewControllerProvider: SampleViewControllerProvider {
    override func createViewController(token: Navigation, context: Void) -> ViewController? {
        guard
            token == .login,
            let registry = self.registry,
            let loginService = serviceProvider?.loginService
        else {
            return nil
        }

        let viewModel = LoginViewModel(loginService: loginService)
        return LoginViewController(viewModel: viewModel, registry: registry)
    }
}
