//
//  ContentView.swift
//  Shared
//
//  Created by Qiwei Li on 8/31/21.
//

import SwiftUI

struct HomeMainView: View {
    @EnvironmentObject var statsModel: ETDStatsModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center){
                HStack(alignment: .center){
                    DataDisplay(data: "\(statsModel.latestBlockInfo?.latestAvgBlockTime ?? 0.0)", description: "Block Time", unit: "seconds")
                    Spacer()
                    DataDisplay(data: "\(statsModel.latestBlockInfo?.latestBlockNumber ?? 0)", description: "# Blocks", unit: "number")
                    Spacer()
                    DataDisplay(data: "\(statsModel.latestBlockInfo?.latestDifficulty ?? 0)", description: "Difficulty", unit: "hash")
                    Spacer()
                    DataDisplay(data: "\(statsModel.latestBlockInfo?.networkHashRate ?? 0)", description: "HashRate", unit: "hash")
                }
                
                if(statsModel.latestBlockInfo != nil){
                    HStack{
                            ChartDisplay(difficultyHistory: statsModel.latestBlockInfo!.difficultyHistory)
                            ChartDisplay(blockTimeHistory: statsModel.latestBlockInfo!.blockTimeHistory)
                           
                        }
                    .frame(height: 400)
                  
                }
                
                HStack{
                    Text("Last Block At \(statsModel.latestBlockInfo?.lastBlockAt ?? "")")
                    Spacer()
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
          
            .cornerRadius(16)
            .padding()
        }
        
    }
}
