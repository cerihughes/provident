//
//  LoginViewControllerProvider.swift
//  SampleApp
//
//  Created by Ceri Hughes on 23/10/2020.
//

import UIKit

class LoginViewControllerProvider: SampleViewControllerProvider {
    override func createViewController(token: Navigation, context: Void) -> UIViewController? {
        guard
            token == .login,
            let registry = self.registry,
            let authenticationService = serviceProvider?.authenticationService
        else {
            return nil
        }

        let viewModel = LoginViewModel(authenticationService: authenticationService)
        return LoginViewController(viewModel: viewModel, registry: registry)
    }
}
