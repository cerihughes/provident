//
//  LogoutViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Provident
import SwiftUI

class LogoutViewControllerProvider: SwiftUIViewControllerProvider {
    override func createView(token: Navigation, context: Void) -> AnyView? {
        guard
            token == .logout,
            let registry = self.registry,
            let authenticationService = serviceProvider?.authenticationService
        else {
            return nil
        }

        let viewModel = LogoutViewModel(authenticationService: authenticationService)
        return AnyView(LogoutView(viewModel: viewModel))
    }
}
