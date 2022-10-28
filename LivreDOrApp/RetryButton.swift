//
//  RetryButton.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 26/10/2022.
//

import SwiftUI

struct RetryButton: View {
    var title: LocalizedStringKey = "Retry"
    
    @Environment(\.refresh) private var action
    @StateObject private var actionPerformer = RefreshActionPerformer()

    var body: some View {
        if let action = action {
            Button {
                Task { await actionPerformer.perform(action)}
            } label: {
                ZStack {
                    if actionPerformer.isPerforming {
                        Text(title).hidden()
                        ProgressView()
                    } else {
                        Text(title)
                    }
                }

            }
            .disabled(actionPerformer.isPerforming)
        }
    }
}

struct RetryButton_Previews: PreviewProvider {
    static var previews: some View {
        RetryButton()
    }
}
