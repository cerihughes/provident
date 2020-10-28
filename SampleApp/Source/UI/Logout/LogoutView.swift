//
//  LogoutView.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import SnapKit
import UIKit

class LogoutView: UIView {
    let logout = UIButton()

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

        addSubview(logout)

        logout.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
