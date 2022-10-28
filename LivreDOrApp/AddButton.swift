//
//  AddButton.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 25/10/2022.
//

import SwiftUI

struct AddButton: View {
    @State private var showingFormView = false
    @Binding var arrayCount: Int
    var body: some View {
        Button {
            showingFormView = true
        } label: {
            Image(systemName: "plus")
        }
        .sheet(isPresented: $showingFormView) {
            FormView(arrayCount: $arrayCount)
        }
        
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(arrayCount: .constant(0))
    }
}
