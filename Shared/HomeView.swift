//
//  ContentView.swift
//  Shared
//
//  Created by Qiwei Li on 8/31/21.
//

import SwiftUI
import WidgetKit

struct HomeView: View {
    
    #if os(macOS)
    func toggleSidebar() {
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif

    var body: some View {
        NavigationView{
            HomeSidebar()
            Text("ETD Stats")
                .frame(width: 400, height: 400, alignment: .center)
        }
        .onDisappear{
            WidgetCenter.shared.reloadAllTimelines()
        }
        .toolbar {
            #if os(macOS)
            ToolbarItem(placement: .navigation) {
                          Button(action: toggleSidebar, label: {
                              Image(systemName: "sidebar.left")
                          })
                      }
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  
    
    static var previews: some View {
        HomeView()
            .environmentObject(ETDStatsModel())
           
    }
}
