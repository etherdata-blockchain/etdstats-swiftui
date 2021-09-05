//
//  ChartDisplay.swift
//  etdstats
//
//  Created by Qiwei Li on 9/5/21.
//

import SwiftUI
import SwiftUICharts

struct ChartDisplay: View {
    let blockTimeHistory: [BlockHistory]?
    let difficultyHistory: [DifficultyHistory]?
    
    init(blockTimeHistory: [BlockHistory]) {
        self.blockTimeHistory = blockTimeHistory
        self.difficultyHistory = nil
    }
    
    init(difficultyHistory: [DifficultyHistory]) {
        self.difficultyHistory = difficultyHistory
        self.blockTimeHistory = nil
    }
    
    func buildBlockTime() -> some View{
        let data = blockTimeHistory!.map{
            p in
            
            return Double(p.blockTime)
        }
        
        return  LineView(data: data, title: "Block Time", legend: "Last 50 blocks's time")
    }
    
    
    func buildDifficulty() -> some View{
        let data = difficultyHistory!.map{
            p in
            
            return p.difficulty
        }
        
        return  LineView(data: data, title: "Difficulty", legend: "Last 50 blocks's difficulty")
    }
    
    var body: some View {
        VStack{
            if(blockTimeHistory != nil){
                 buildBlockTime()
            } else if(difficultyHistory != nil){
                 buildDifficulty()
            } else{
                 Text("")
            }
        }
    }
}

struct ChartDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ChartDisplay(difficultyHistory: [DifficultyHistory(difficulty: 10, time: "111"), DifficultyHistory(difficulty: 20, time: "111"), DifficultyHistory(difficulty: 10, time: "111"),DifficultyHistory(difficulty: 10, time: "111")])
    }
}
