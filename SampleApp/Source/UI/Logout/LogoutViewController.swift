//
//  LogoutViewController.swift
//  SampleApp
//
//  Created by Ceri Hughes on 28/10/2020.
//

import Provident
import UIKit

class LogoutViewController: UIViewController {
    private let viewModel: LogoutViewModel
    private let registry: Registry<Navigation, Void>
    private lazy var logoutView = LogoutView()

    init(viewModel: LogoutViewModel, registry: Registry<Navigation, Void>) {
        self.viewModel = viewModel
        self.registry = registry
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = logoutView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        logoutView.logout.setTitle(viewModel.logoutTitle, for: .normal)
        logoutView.logout.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }

    @objc
    private func logoutTapped(sender: UIButton) {
        viewModel.logout { [weak self] in
            guard let self, let window = self.view.window else { return }
            Navigation.login.navigate(using: registry, from: self, in: window)
        }
    }
}
