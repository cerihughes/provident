//
//  ErrorView.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import SnapKit
import UIKit

class ErrorView: UIView {
    let label = UILabel()

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

        addSubview(label)

        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
