//
//  _024_vision_pro_blindApp.swift
//  2024 vision pro blind
//
//  Created by 장시영 on 4/11/24.
//

import SwiftUI

@main
struct _024_vision_pro_blindApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
