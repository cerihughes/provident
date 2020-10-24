//
//  ErrorViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Provident
import SwiftUI

class ErrorViewControllerProvider: SampleViewControllerProvider {
    override func createViewController(token: Navigation, context: Void) -> ViewController? {
        guard
            case let .error(message) = token
        else {
            return nil
        }

        let viewModel = ErrorViewModel(message: message)
        let view = ErrorView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
