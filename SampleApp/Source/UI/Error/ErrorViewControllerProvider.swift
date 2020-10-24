//
//  ErrorViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Provident
import SwiftUI

class ErrorViewControllerProvider: SwiftUIViewControllerProvider {
    override func createView(token: Navigation, context: Void) -> AnyView? {
        guard
            case let .error(message) = token
        else {
            return nil
        }

        let viewModel = ErrorViewModel(message: message)
        return AnyView(ErrorView(viewModel: viewModel))
    }
}
