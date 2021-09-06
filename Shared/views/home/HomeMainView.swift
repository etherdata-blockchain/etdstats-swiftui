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
          
            .cornerRadius(16)
            .padding()
        }
        
    }
}
