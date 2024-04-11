//
//  ContentView.swift
//  2024 vision pro blind
//
//  Created by 장시영 on 4/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent // 추가해야 할 부분

struct ContentView: View {
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("실행")
                Text("튜토리얼")
            }
            .navigationTitle("설정")
        } detail: {
            VStack {
                // Model3D(named: "Scene", bundle: realityKitContentBundle)
                // 위 코드 대신에 임의의 내용을 사용하도록 변경 (임시적으로 주석 처리)
                Text("세상의 소리를 향한 발걸음")
                
                Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                    .font(.title)
                    .frame(width: 360)
                    .padding(24)
                    .glassBackgroundEffect()
            }
            navigationTitle("EYE-D")
            .padding()
            .onChange(of: showImmersiveSpace) { newValue in
                Task {
                    if newValue {
                        switch await openImmersiveSpace(id: "ImmersiveSpace") {
                        case .opened:
                            immersiveSpaceIsShown = true
                        case .error, .userCancelled:
                            fallthrough
                        @unknown default:
                            immersiveSpaceIsShown = false
                            showImmersiveSpace = false
                        }
                    } else if immersiveSpaceIsShown {
                        await dismissImmersiveSpace()
                        immersiveSpaceIsShown = false
                    }
                }
            }
        }
    }
    
    // Preview 추가
    #if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    #endif
}
