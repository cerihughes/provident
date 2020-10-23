//
//  SampleViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 22/10/2020.
//

import Provident

class SampleViewControllerProvider: SingleViewControllerProvider<Navigation, Void> {
    weak var registry: Registry<Navigation, Void>?

    override func register(with registry: Registry<Navigation, Void>) {
        super.register(with: registry)

        self.registry = registry
    }
}
