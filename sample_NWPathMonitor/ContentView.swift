//
//  ContentView.swift
//  sample_NWPathMonitor
//
//  Created by Masahiko Minagawa on 2023/04/22.
//

import SwiftUI

struct ContentView: View {
    
    // ObservableObjectのMonitoringNetworkStateをEnvironmentObjectとして定義する
    @EnvironmentObject var networkState: MonitoringNetworkState
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(networkState.isConnected ? .blue : .black)
            
            Text(networkState.isConnected ? "Network Connected." : "Network Disconnected")
                .foregroundColor(.white)
        }
        
        /*
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
