//
//  DetailView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import SwiftUI

struct DetailView: View {
    let messageContent: String
    var body: some View {
        Text(messageContent)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(messageContent: "Hello Dina")
    }
}
