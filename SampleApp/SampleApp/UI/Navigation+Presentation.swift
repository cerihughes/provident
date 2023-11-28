//
//  Navigation+Presentation.swift
//  SampleApp
//
//  Created by Ceri Hughes on 28/10/2020.
//

import Provident
import UIKit

extension Navigation {
    func navigate(
        using registry: AnyRegistry<Navigation, Void>,
        from previous: UIViewController?,
        in window: UIWindow
    ) throws {
        let viewController = try registry.createViewController(from: self)
        present(viewController: viewController, from: previous, in: window)
    }

    private func present(viewController: UIViewController, from previous: UIViewController?, in window: UIWindow) {
        switch self {
        case .login:
            window.setRootViewController(
                UINavigationController(rootViewController: viewController),
                options: .transitionFlipFromRight
            )
        case .logout:
            window.setRootViewController(
                UINavigationController(rootViewController: viewController),
                options: .transitionFlipFromLeft
            )
        default:
            previous?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension UIWindow {
    func setRootViewController(
        _ viewController: UIViewController,
        duration: TimeInterval = 1.0,
        options: UIView.AnimationOptions?
    ) {
        rootViewController = viewController

        if let options {
            UIView.transition(with: self, duration: duration, options: options, animations: {})
        }
    }
}
