//
//  TransactionDetailView.swift
//  etdstats
//
//  Created by Qiwei Li on 9/6/21.
//

import SwiftUI

struct TransactionDetailView: View {
    let id: String
    @State var searchResult: SearchResponse?
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack{
            if isLoading{
                HStack{
                    Spacer()
                    ProgressView("Loading...")
                    Spacer()
                }
            }
            
            if let searchResult = searchResult{
                TransactionList(searchResult: searchResult)
            }
        }
        .frame(minWidth: 300, minHeight: 300)
        .onAppear{
            isLoading = true
            ETDStatsDataFetcher.searchBy(id: id){
                data in
                if let data = data{
                    searchResult = data
                }
                
                isLoading = false
            }
        }
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(id: "")
    }
}
