//
//  DataDisplay.swift
//  etdstats
//
//  Created by Qiwei Li on 8/31/21.
//

import SwiftUI

struct DataDisplay: View {
    let data: String;
    let description: String;
    let unit: String;
    
    var body: some View {
        HStack{
            Text("\(data)")
                .font(.title2)
            Divider()
            VStack{
                Text("\(description)\n\(unit)")
                    .font(.title2)
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
      
    }
}

struct DataDisplay_Previews: PreviewProvider {
    static var previews: some View {
        DataDisplay(data: "7.83", description: "Block Time", unit: "s")
    }
}
