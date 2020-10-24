//
//  LogoutView.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import SwiftUI

struct LogoutView: View {
    @ObservedObject var viewModel: LogoutViewModel

    init(viewModel: LogoutViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Button(action: {
            viewModel.logout {
                print("done")
            }
        }) {
            Text("Logout")
        }
    }
}
