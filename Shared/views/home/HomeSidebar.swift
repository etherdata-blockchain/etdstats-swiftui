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
                
                Text("ETD Stats")
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
