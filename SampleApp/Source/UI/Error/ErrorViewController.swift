//
//  ErrorViewController.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import UIKit

class ErrorViewController: UIViewController {
    private let viewModel: ErrorViewModel
    private lazy var errorView = ErrorView()

    init(viewModel: ErrorViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = errorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        errorView.label.text = viewModel.message
    }
}
