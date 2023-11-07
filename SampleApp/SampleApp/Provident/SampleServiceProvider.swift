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
    let name = sampleServiceProviderName

    required init(context: ServiceProviderCreationContext) {}
}
