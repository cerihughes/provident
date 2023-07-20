//
//  ErrorViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import UIKit

class ErrorViewControllerProvider: SampleViewControllerProvider {
    override func createViewController(token: Navigation, context: Void) -> UIViewController? {
        guard
            case let .error(message) = token
        else {
            return nil
        }

        let viewModel = ErrorViewModel(message: message)
        return ErrorViewController(viewModel: viewModel)
    }
}
