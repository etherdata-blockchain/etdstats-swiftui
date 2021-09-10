//
//  ContentView.swift
//  Shared
//
//  Created by Qiwei Li on 8/31/21.
//

import SwiftUI

struct HomeMainView: View {
    @EnvironmentObject var statsModel: ETDStatsModel
    
    
    
    fileprivate func buildLargeScreen() -> some View{
        return VStack(alignment: .center){
            if(statsModel.latestBlockInfo != nil){
                HStack(alignment: .center){
                    DataDisplay(data: "\(statsModel.latestBlockInfo!.latestAvgBlockTime)", description: "Block Time", unit: "seconds")
                    Spacer()
                    DataDisplay(data: "\(statsModel.latestBlockInfo!.latestBlockNumber)", description: "# Blocks", unit: "number")
                    Spacer()
                    DataDisplay(data: "\(statsModel.latestBlockInfo!.latestDifficulty)", description: "Difficulty", unit: "hash")
                    Spacer()
                    DataDisplay(data: "\(statsModel.latestBlockInfo!.networkHashRate)", description: "HashRate", unit: "hash")
                }
                
                
                HStack{
                    ChartDisplay(difficultyHistory: statsModel.latestBlockInfo!.difficultyHistory)
                    ChartDisplay(blockTimeHistory: statsModel.latestBlockInfo!.blockTimeHistory)
                    
                }
                .frame(height: 400)
                
                
                
                HStack{
                    Text("Last Block At \(statsModel.latestBlockInfo!.lastBlockAt)")
                    Spacer()
                }
                
            } else {
                ProgressView("Connecting to the stats server...")
            }
            
            
            List{
                ForEach(statsModel.peersInfo){
                    peer in
                    ListItem(peer: peer)
                }
                
            }
            .frame(height: 500)
            .listStyle(InsetListStyle())
        }
        .padding()
    }
    
    func buildSmallScreen() -> some View{
        return LazyVStack(alignment: .center){
            if(statsModel.latestBlockInfo != nil){
                HStack{
                    DataDisplay(data: "\(statsModel.latestBlockInfo!.latestAvgBlockTime)", description: "Block Time", unit: "seconds")
                    DataDisplay(data: "\(statsModel.latestBlockInfo!.latestBlockNumber)", description: "# Blocks", unit: "number")
                }
                
                HStack{
                    DataDisplay(data: "\(statsModel.latestBlockInfo!.latestDifficulty)", description: "Difficulty", unit: "hash")
                    DataDisplay(data: "\(statsModel.latestBlockInfo!.networkHashRate)", description: "HashRate", unit: "hash")
                }
                
                Group{
                    ChartDisplay(difficultyHistory: statsModel.latestBlockInfo!.difficultyHistory)
                    ChartDisplay(blockTimeHistory: statsModel.latestBlockInfo!.blockTimeHistory)
                }
                .frame(height: 400)
                
                HStack{
                    Text("Last Block At \(statsModel.latestBlockInfo!.lastBlockAt)")
                    Spacer()
                }
                
                ForEach(statsModel.peersInfo){
                    peer in
                    ListItem(peer: peer)
                }
                
            } else {
                HStack{
                    Spacer()
                    ProgressView("Connecting to the stats server...")
                    Spacer()
                }
            }
        }
        .padding()
    }
    
    var body: some View {
        GeometryReader{
            geo in
            ScrollView {
                #if os(macOS)
                buildLargeScreen()
                #else
                if(geo.size.width > 1024){
                    buildLargeScreen()
                } else{
                    buildSmallScreen()
                }
                #endif
            }
        }
        .navigationTitle(Text("ETD Stats"))
        
    }
}
