//
//  SampleServiceProvider.swift
//  App
//
//  Created by Ceri Hughes on 22/10/2020.
//

import Provident

class SampleServiceProvider: ServiceProvider {
    let sampleService: SampleService = SampleServiceImplementation()
}
