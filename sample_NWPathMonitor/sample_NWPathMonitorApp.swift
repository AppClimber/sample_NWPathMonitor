//
//  sample_NWPathMonitorApp.swift
//  sample_NWPathMonitor
//
//  Created by Masahiko Minagawa on 2023/04/22.
//

import SwiftUI

@main
struct sample_NWPathMonitorApp: App {
    var body: some Scene {
        WindowGroup {
            // ContentViewでEnvironmentObjectを使用しているので，
            // ContentView呼び出し時にenvironmentのModifierを使用し，MonitoringNetworkStateを渡す．
            // サブ階層にObservableObjectを提供するために必要
            ContentView()
                .environmentObject(MonitoringNetworkState())
        }
    }
}
