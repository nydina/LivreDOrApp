//
//  ErrorView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 26/10/2022.
//

import SwiftUI

struct ErrorView: View {
    @Binding var error: Error?

    var body: some View {
        if let error = error {
            VStack {
                Text(error.localizedDescription)
                    .bold()
                HStack {
                    Button("Dismiss") {
                        self.error = nil
                    }
                    RetryButton()
                }
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

//struct ErrorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorView()
//    }
//}
