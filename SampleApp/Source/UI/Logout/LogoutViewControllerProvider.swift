//
//  LogoutViewControllerProvider.swift
//  SampleApp
//
//  Created by Ceri Hughes on 24/10/2020.
//

import UIKit

class LogoutViewControllerProvider: SampleViewControllerProvider {
    override func createViewController(token: Navigation, context: Void) -> UIViewController? {
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
