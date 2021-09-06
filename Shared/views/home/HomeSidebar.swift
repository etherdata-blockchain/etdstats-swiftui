//
//  HomeSidebar.swift
//  etdstats
//
//  Created by Qiwei Li on 9/1/21.
//

import SwiftUI

struct HomeSidebar: View {
    var body: some View {
        List{
            NavigationLink(
                destination: HomeMainView()){
                
                HStack {
                    Image(systemName: "chart.bar.xaxis")
                    Text("ETD Stats")
                }
            }
            
            NavigationLink(
                destination: TransactionView()){
                
                HStack {
                    Image(systemName: "chart.bar.doc.horizontal.fill")
                    Text("Transactions")
                }
            }
        }
        .frame(width: 150)
    }
}

struct HomeSidebar_Previews: PreviewProvider {
    static var previews: some View {
        HomeSidebar()
    }
}
