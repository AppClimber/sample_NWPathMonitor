//
//  MonitoringNetworkState.swift
//  sample_NWPathMonitor
//
//  Created by Masahiko Minagawa on 2023/04/22.
//

import Foundation
import Network

// ObservableObject:
// @Publishを指定した値を監視し，Viewを更新してくれる機能
// ObservableObjectはプロトコル．Viewに使用する
// 再描画を行うためにはView側にObserbedObjectまたはEnvironmentObjectとして渡す必要がある

class MonitoringNetworkState: ObservableObject {
    
    private let monitor = NWPathMonitor()
    
    // パス配信をするイベントキュー
    private let queue = DispatchQueue.global(qos: .background)
    
    // ネットワーク状態をパブリッシュする変数
    @Published var isConnected = false
    
    init() {
        
        // 初期化時にパスモニターを開始する
        monitor.start(queue: queue)
        
        // アップデート時のハンドラ
        monitor.pathUpdateHandler = { path in
            
            // self.printNWPathParams(path)
            
            if path.status == .satisfied {
                
                DispatchQueue.main.async {
                    
                    self.isConnected = true
                }
            }
            else {
                
                DispatchQueue.main.async {
                    
                    self.isConnected = false
                }
            }
        }
    }
    
    private func printNWPathParams(_ path: NWPath) {
        
        print("path=\(path)")
        print("path.unsatisfiedReason=\(path.unsatisfiedReason)")
        print("path.debugDescription=\(path.debugDescription)")
        print("path.gateways=\(path.gateways)")
        print("path.availableInterfaces=\(path.availableInterfaces)")
        print("path.supportsDNS=\(path.supportsDNS)")
        print("path.supportsIPv4=\(path.supportsIPv4)")
        print("path.supportsIPv6=\(path.supportsIPv6)")
    }
}
