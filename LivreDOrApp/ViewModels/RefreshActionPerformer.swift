//
//  RefreshActionPerformer.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 26/10/2022.
//

import Foundation
import SwiftUI
class RefreshActionPerformer: ObservableObject {
    @Published private(set) var isPerforming = false

    func perform(_ action: RefreshAction) async {
        guard !isPerforming else { return }
        isPerforming = true
        await action()
        isPerforming = false
    }
}

