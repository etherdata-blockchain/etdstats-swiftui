//
//  ListItem.swift
//  etdstats
//
//  Created by Qiwei Li on 9/1/21.
//

import SwiftUI

struct ListItem: View {
    let peer: PeerInfoElement
    
    var body: some View {

        HStack(alignment: .top){
            Image(systemName: "desktopcomputer")
                .font(.system(size: 40))
            
            Divider()
            VStack(alignment:.leading){
                Text(peer.data?.systemInfo.name ?? "No Name")
                    .font(.headline)
                Spacer()
                Text("Peer Count: \(peer.data?.systemInfo.peerCount ?? 0)")
            }
            
            Spacer()
            
            VStack{
                Spacer()
                Text("Online Status")
                
                if(!peer.isOnline){
                    Text("Offline")
                        .font(.title2)
                        .foregroundColor(Color.red)
                } else{
                    Text("Online")
                        .font(.title2)
                        .foregroundColor(Color.green)
                    
                }
        
                Spacer()
            }
            
            Spacer()
            VStack{
                Spacer()
                Text("Block Number")
                Text("\(peer.data?.blockNumber ?? 0)")
                    .font(.title2)
                Spacer()
            }
        }
        .padding()
        .frame(height: 120)
        
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(peer: PeerInfoElement(id: "1", isOnline: true, lastSeen: "", data: DataClass(timestamp: 10101, difficulty: "1010", gasLimit: 1, gasUsed: 1, hash: "jj", miner: "aa", nonce: "aa", balance: "200", blockNumber: 200, systemInfo: SystemInfo(name: "a", peerCount: 2, isMining: true, isSyncing: true, coinbase: "a", nodeVersion: "a", hashRate: 300, nodeID: "1"), blockTime: 1, avgBlockTime: 2)))
    }
}
