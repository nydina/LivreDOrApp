//
//  AddPhoto.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 25/10/2022.
//

import SwiftUI

struct AddPhoto: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 250)
                .foregroundColor(.gray.opacity(0.15))
                .cornerRadius(20)
            VStack {
                Image(systemName: "camera.circle")
                
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.teal)
                Text("Put on your best smile")
                    .font(.title2)
                    .foregroundColor(.teal
                    )
            }
            
            
        }
    }
}

struct AddPhoto_Previews: PreviewProvider {
    static var previews: some View {
        AddPhoto()
    }
}
