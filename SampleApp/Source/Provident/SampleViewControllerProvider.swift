//
//  SampleViewControllerProvider.swift
//  SampleApp
//
//  Created by Ceri Hughes on 22/10/2020.
//

import Provident

class SampleViewControllerProvider: ViewControllerProvider {
    weak var registry: Registry<Navigation, Void>?
    var serviceProvider: SampleServiceProvider?

    func register(with registry: Registry<Navigation, Void>) {
        self.registry = registry
    }

    final func configure(with serviceProviders: [String: ServiceProvider]) {
        serviceProvider = serviceProviders[sampleServiceProviderName] as? SampleServiceProvider
    }

    func createViewController(token: Navigation, context: ()) -> Provident.ViewController? {
        nil // OVERRIDE
    }
}
