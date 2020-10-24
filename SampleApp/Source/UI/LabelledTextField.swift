//
//  LabelledTextField.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import SnapKit
import UIKit

class LabelledTextField: UIView {
    let label = UILabel()
    let textField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        label.textAlignment = .right
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no

        addSubview(label)
        addSubview(textField)

        label.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
        }

        textField.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.trailing).offset(16)
            make.width.equalTo(label)
            make.top.bottom.trailing.equalToSuperview()
        }
    }
}
