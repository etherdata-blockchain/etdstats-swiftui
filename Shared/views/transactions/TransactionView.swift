//
//  TransactionView.swift
//  etdstats
//
//  Created by Qiwei Li on 9/6/21.
//

import SwiftUI


struct TransactionView: View {
    @State var text: String = ""
    @State var isLoading = false
    @State var searchResult: SearchResponse?
    
    
    func search(){
        isLoading = true;
        if text.isEmpty{
            return 
        }
        
        ETDStatsDataFetcher.searchBy(id: text){
            data in
            searchResult = data;
            isLoading = false
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading){
                HStack {
                    TextField("Transaction/User/Block ID", text: $text)
                        .frame(minWidth: 300)
                        
                    Button(action: {
                        search()
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    
                    Spacer()
                   
                }
                .padding()
                if(isLoading){
                    HStack {
                        Spacer()
                        ProgressView("Loading...")
                        Spacer()
                    }
                }
                
                if let searchResult = searchResult{
                    TransactionList(searchResult: searchResult)
                }
                
                Spacer()
            }
        }
        
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
