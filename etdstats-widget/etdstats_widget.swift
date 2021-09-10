//
//  etdstats_widget.swift
//  etdstats-widget
//
//  Created by Qiwei Li on 9/10/21.
//

import WidgetKit
import SwiftUI
import Intents

let demoData = WebThreeData(latestAvgBlockTime: 10, latestDifficulty: 100000, latestBlockNumber: 0, lastBlockAt: "2020", difficultyHistory: [], blockTimeHistory: [])

struct Provider: IntentTimelineProvider {
    typealias Entry = ETDStatsEntry
    
    typealias Intent = ConfigurationIntent

    
    func placeholder(in context: Context) -> ETDStatsEntry {
        ETDStatsEntry(data: demoData)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ETDStatsEntry) -> ()) {
        let entry = ETDStatsEntry(data: demoData)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        ETDStatsDataFetcher.getLatestInfo{
            data in
            
            var entries: [ETDStatsEntry] = [
                ETDStatsEntry(data: data)
            ]
           
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}

struct ETDStatsEntry: TimelineEntry {
    var date: Date = Date()
    let data: WebThreeData
}

struct etdstats_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Image(systemName: "server.rack")
                    .foregroundColor(Color.orange)
                VStack(alignment: .leading){
                    Text("\(entry.data.latestBlockNumber)")
                    Text("Block Number")
                        .font(.caption2)
                }
            }
            
            Divider()
            HStack{
                Image(systemName: "desktopcomputer")
                    .foregroundColor(Color.blue)
                VStack(alignment: .leading) {
                    Text("\(Double(entry.data.networkHashRate).abbreviateNumber())")
                    Text("Hashrate")
                        .font(.caption2)
                }
            }
            
            Text("\(entry.data.lastBlockAt)")
                .font(.caption2)
                .padding(.top, 1.0)
                
        }
        .padding()
    }

}

@main
struct etdstats_widget: Widget {
    let kind: String = "etdstats_widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            etdstats_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct etdstats_widget_Previews: PreviewProvider {
    static var previews: some View {
        etdstats_widgetEntryView(entry: ETDStatsEntry(data: demoData))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
