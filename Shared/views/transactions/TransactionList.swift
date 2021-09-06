//
//  TransactionList.swift
//  etdstats
//
//  Created by Qiwei Li on 9/6/21.
//

import SwiftUI

struct TransactionList: View {
    let searchResult: SearchResponse
    
    func makeBlockList(block: BlockDetail) -> some View{
        return List{
            Text("#Block \(block.number)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Divider()
            
            NavigationLink(destination: TransactionDetailView(id: block.miner)){
                HStack{
                    Text("Miner")
                    Spacer()
                    Text("\(block.miner)")
                }
            }
            
            HStack{
                Text("Time")
                Spacer()
                Text("\(block.timestamp)")
            }
            
            HStack{
                Text("#Uncles")
                Spacer()
                Text("\(block.uncles.count)")
            }
            
        
            HStack{
                Text("Difficulty")
                Spacer()
                Text("\(block.totalDifficulty)")
            }
            
            NavigationLink(destination: TransactionDetailView(id: block.parentHash)){
                HStack{
                    Text("Parent Hash")
                    Spacer()
                    Text("\(block.parentHash)")
                }
            }
            
            HStack{
                Text("Gas Limit")
                Spacer()
                Text("\(block.gasLimit)")
            }
            
            
            HStack{
                Text("Gas Used")
                Spacer()
                Text("\(block.gasUsed)")
            }

            
            Section(header: Text("Transactions") ){
                ForEach(block.transactions, id: \.self){
                    tx in
                    NavigationLink(destination: TransactionDetailView(id: tx)){
                        Text("\(tx)")
                    }
                }
            }
           
            
        }
        .navigationTitle(Text("Block"))
    }
    
    func makeUserList(user: UserDetail) -> some View{
        return List{
            HStack{
                Text("Balance")
                Spacer()
                Text("\(user.balance.toETD()) ETD")
            }
            
            ForEach(user.transactions, id: \.hash){
                transaction in
                Section(header: Text("Tx: \(transaction.hash)")){
                    HStack{
                        Text("Time")
                        Spacer()
                        Text("\(transaction.time)")
                    }
                    
                    NavigationLink(destination: TransactionDetailView(id: transaction.from)){
                        HStack{
                            Text("Transaction From")
                            Spacer()
                            Text("\(transaction.from)")
                        }
                    }
                    
                    NavigationLink(destination: TransactionDetailView(id: transaction.to)){
                        HStack{
                            Text("Transaction to")
                            Spacer()
                            Text("\(transaction.to)")
                        }
                    }
                    
                    HStack{
                        Text("Amount")
                        Spacer()
                        Text("\(transaction.value.toETD()) ETD")
                    }
                    
                    HStack{
                        Text("Gas")
                        Spacer()
                        Text("\(transaction.gas)")
                    }
                    
                    HStack{
                        Text("Gas Price")
                        Spacer()
                        Text("\(transaction.gasPrice)")
                    }
                    
                    
                    Divider()
                }
            }
            
        }
    }
    
    func makeTransaction(transaction: TransactionDetail) -> some View{
        return List{
            HStack{
                Text("Tx ID")
                Spacer()
                Text("\(transaction.transaction.hash)")
            }
            
            HStack{
                Text("Status")
                Spacer()
                Text("\(transaction.status)")
            }
            
            NavigationLink(destination: TransactionDetailView(id: transaction.block.hash)){
                HStack{
                    Text("Block")
                    Spacer()
                    Text("\(transaction.block.hash)")
                }
            }
            
            NavigationLink(destination: TransactionDetailView(id: transaction.transaction.from)){
                HStack{
                    Text("From")
                    Spacer()
                    Text("\(transaction.transaction.from)")
                }
            }
            
            NavigationLink(destination: TransactionDetailView(id: transaction.transaction.to)){
                HStack{
                    Text("To")
                    Spacer()
                    Text("\(transaction.transaction.to)")
                }
            }
            
            HStack{
                Text("Amount")
                Spacer()
                Text("\(transaction.transaction.value)")
            }
        }
    }
    
    var body: some View {
        Form{
            if let block = searchResult.block{
                makeBlockList(block: block)
            }
            
            if let user = searchResult.user{
                makeUserList(user: user)
            }
            
            if let transacton = searchResult.transaction{
                makeTransaction(transaction: transacton)
            }
        }
    }
}

struct TransactionList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionList(searchResult: SearchResponse(block: nil, user: UserDetail(balance: "200", transactions: [UserTransaction(hash: "1", from: "2", gas: 1, gasPrice: "2", lowercaseFrom: "a", lowercaseTo: "b", time: "a", to: "b", value: "300")]), transaction: nil))
    }
}

struct TransactionList_Previews2: PreviewProvider {
    static var previews: some View {
        TransactionList(searchResult: SearchResponse(block: BlockDetail(difficulty: "1", extraData: "2", gasLimit: 3, gasUsed: 4, hash: "a", logsBloom: "s", miner: "s", mixHash: "a", nonce: "1", number: 200, parentHash: "a", receiptsRoot: "a", sha3Uncles: "a", size: 2, stateRoot: "a", timestamp: 2000, totalDifficulty: "a", transactions: ["0x123456"], transactionsRoot: "a", uncles: []), user: nil, transaction: nil))
    }
}

struct TransactionList_Previews3: PreviewProvider {
    static var previews: some View {
        TransactionList(searchResult: SearchResponse(block: nil, user: nil, transaction: TransactionDetail(status: "success", block: BlockDetail(difficulty: "1", extraData: "1", gasLimit: 1, gasUsed: 2, hash: "a", logsBloom: "a", miner: "a", mixHash: "s", nonce: "a", number: 1, parentHash: "f", receiptsRoot: "c", sha3Uncles: "x", size: 1, stateRoot: "1", timestamp: 123, totalDifficulty: "1", transactions: [], transactionsRoot: "", uncles: []), transaction: Transaction(blockHash: "1", blockNumber: 2, from: "a", gas: 1, gasPrice: "2", hash: "1", input: "a", nonce: 1, to: "a", transactionIndex: 1, value: "2", type: "", v: "", r: "", s: "", time: "2020"))))
    }
}



