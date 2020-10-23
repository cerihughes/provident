//
//  LoginViewController.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import Provident
import UIKit

class LoginViewController: UIViewController {
    private let registry: Registry<Navigation, Void>
    private lazy var loginView = LoginView()

    init(registry: Registry<Navigation, Void>) {
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

        title = "Login"

        loginView.username.label.text = "Username:"
        loginView.password.label.text = "Password:"
        loginView.submit.setTitle("Submit", for: .normal)
        loginView.submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
    }

    @objc
    private func submitTapped(sender: UIButton) {}
}
