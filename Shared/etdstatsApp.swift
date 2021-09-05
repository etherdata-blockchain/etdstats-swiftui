//
//  etdstatsApp.swift
//  Shared
//
//  Created by Qiwei Li on 8/31/21.
//

import SwiftUI

@main
struct etdstatsApp: App {
    @StateObject var etdStatsModel: ETDStatsModel = ETDStatsModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(etdStatsModel)
        }
    }
}
