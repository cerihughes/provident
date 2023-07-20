//
//  SampleViewControllerProvider.swift
//  App
//
//  Created by Ceri Hughes on 22/10/2020.
//

import Provident

class SampleViewControllerProvider: SingleViewControllerProvider<Navigation, Void> {
    weak var registry: Registry<Navigation, Void>?
    var serviceProvider: SampleServiceProvider?

    override func register(with registry: Registry<Navigation, Void>) {
        super.register(with: registry)
        self.registry = registry
    }

    override final func configure(with serviceProviders: [String: ServiceProvider]) {
        super.configure(with: serviceProviders)
        serviceProvider = serviceProviders[sampleServiceProviderName] as? SampleServiceProvider
    }
}
