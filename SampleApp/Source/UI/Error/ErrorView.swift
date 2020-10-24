//
//  ErrorView.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var viewModel: ErrorViewModel

    init(viewModel: ErrorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text(viewModel.message)
    }
}
