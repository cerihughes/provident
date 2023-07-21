//
//  LoginViewController.swift
//  SampleApp
//
//  Created by Ceri Hughes on 23/10/2020.
//

import Provident
import UIKit

class LoginViewController: UIViewController {
    private let viewModel: LoginViewModel
    private let registry: Registry<Navigation, Void>
    private lazy var loginView = LoginView()

    init(viewModel: LoginViewModel, registry: Registry<Navigation, Void>) {
        self.viewModel = viewModel
        self.registry = registry
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.username.label.text = viewModel.usernameTitle
        loginView.password.label.text = viewModel.passwordTitle
        loginView.submit.setTitle(viewModel.submitTitle, for: .normal)

        loginView.username.textField.addTarget(self, action: #selector(updateUsername), for: .editingChanged)
        loginView.password.textField.addTarget(self, action: #selector(updatePassword), for: .editingChanged)
        loginView.submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
    }

    @objc
    private func updateUsername(sender: UITextField) {
        update(from: sender, keypath: \.username)
    }

    @objc
    private func updatePassword(sender: UITextField) {
        update(from: sender, keypath: \.password)
    }

    private func update(from textField: UITextField, keypath: ReferenceWritableKeyPath<LoginViewModel, String>) {
        viewModel[keyPath: keypath] = textField.text ?? ""
    }

    @objc
    private func submitTapped(sender: UIButton) {
        viewModel.login { [weak self] result in
            guard let self, let window = self.view.window else { return }
            let nextToken: Navigation = result ? .logout : .error(message: "Incorrect username or password")
            nextToken.navigate(using: self.registry, from: self, in: window)
        }
    }
}
