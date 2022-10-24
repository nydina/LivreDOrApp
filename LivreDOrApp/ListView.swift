//
//  ListView.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import SwiftUI

struct ListView: View {
    let texts: Row
    var body: some View {
        NavigationView {
            List(texts) { text in
                Text()
            }
                    
                
            }
        }
        }

        
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(texts: MessageViewModel().messages)
    }
}
