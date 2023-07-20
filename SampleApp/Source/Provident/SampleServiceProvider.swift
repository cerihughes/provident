//
//  SampleServiceProvider.swift
//  SampleApp
//
//  Created by Ceri Hughes on 22/10/2020.
//

import Provident

let sampleServiceProviderName = "sampleServiceProviderName"

class SampleServiceProvider: ServiceProvider {
    let authenticationService: AuthenticationService = AuthenticationServiceImplementation()

    override init(context: ServiceProviderCreationContext) {
        super.init(context: context)
        name = sampleServiceProviderName
    }
}
