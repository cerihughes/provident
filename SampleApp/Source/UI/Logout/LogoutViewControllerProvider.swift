//
//  LogoutViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Provident
import UIKit

class LogoutViewControllerProvider: SampleViewControllerProvider {
    override func createViewController(token: Navigation, context: Void) -> ViewController? {
        guard
            token == .logout,
            let registry = self.registry,
            let authenticationService = serviceProvider?.authenticationService
        else {
            return nil
        }

        let viewModel = LogoutViewModel(authenticationService: authenticationService)
        return LogoutViewController(viewModel: viewModel, registry: registry)
    }
}
