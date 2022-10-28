//
//  RowView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import SwiftUI

struct RowView: View {
    let messageContent: String
    var body: some View {
        HStack {
            Image("helen")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            Text(messageContent)
        }
        .frame(maxHeight: 75)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(messageContent: "Here is my message")
    }
}
