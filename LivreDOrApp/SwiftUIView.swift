//
//  SwiftUIView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 27/10/2022.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Environment(\.refresh) private var refresh
    
    var body: some View {
        Group {
            if let refresh = refresh {
                Button(action: {
                    Task {
                        await refresh()
                    }
                }) {
                    Text("Update Rate")
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
