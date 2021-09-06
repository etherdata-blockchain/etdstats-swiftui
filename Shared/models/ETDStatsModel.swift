//
//  ETDStatsModel.swift
//  etdstats
//
//  Created by Qiwei Li on 8/31/21.
//

import Foundation
import SocketIO
import Alamofire

class ETDStatsModel: ObservableObject{
//    private var manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(false)])
    private var manager = SocketManager(socketURL: URL(string: "https://etd.monitor.sirileepage.com")!, config: [.log(false)])

    @Published var latestBlockInfo: WebThreeData?
    @Published var peersInfo: [PeerInfoElement] = []
   
    
    init() {
        let socket = manager.socket(forNamespace: "/clients")
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        socket.on(clientEvent: .error){
            data, ack in
            print("Disconnected. Due to \(data)")
        }
        
        socket.on("history"){
            data, ak in
            if let data = data as? Array<Any> {
                if let  jsonData = data[0] as? [String: Any]{
                    let webThreeData = try? WebThreeData(dictionary: jsonData)
                    self.latestBlockInfo = webThreeData
                }
                
            } else{
                print("Cannot parse data!")
            }
           
        }
        
        socket.on("realtime-info"){
            data, ak in
            if let data = data as? Array<Any> {
                if let  jsonData = data[0] as? [[String: Any]]{
                    let systemInfo: [PeerInfoElement] = jsonData.map{
                        data in
                        try? PeerInfoElement(dictionary: data)
                    }.filter{
                        data in
                        
                        data != nil
                    } as! [PeerInfoElement]
                    
                    self.peersInfo = systemInfo
                }
                
            } else{
                print("Cannot parse data!")
            }
           
        }
        
        socket.connect()
    }
}

class ETDStatsDataFetcher{
    
    
    static func searchBy(id: String, onResult: @escaping (_ data: SearchResponse? )-> Void){
        let baseURL = "https://etd.monitor.sirileepage.com"
        
        AF.request(baseURL + "/api/v2/transactions/" + id).responseDecodable(of: SearchResponse.self){
            response in
            print("getting user: \(response)")
            if let value = response.value{
                onResult(value)
            } else{
                onResult(nil)
            }
        }
        
    }
}
