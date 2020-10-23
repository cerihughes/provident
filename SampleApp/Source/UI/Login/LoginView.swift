//
//  LoginView.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import SnapKit
import UIKit

class LoginView: UIView {
    let username = LabelledTextField()
    let password = LabelledTextField()
    let submit = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .lightGray

        addSubview(username)
        addSubview(password)
        addSubview(submit)

        username.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }

        password.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(16)
            make.leading.trailing.equalTo(username)
        }

        submit.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(16)
            make.leading.trailing.equalTo(username)
        }
    }
}
