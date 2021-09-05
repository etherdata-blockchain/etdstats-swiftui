// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let peerInfo = try? newJSONDecoder().decode(PeerInfo.self, from: jsonData)

import Foundation

// MARK: - PeerInfoElement
struct PeerInfoElement: Codable, Identifiable {
    let id: String
    let isOnline: Bool
    let lastSeen: String
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let timestamp: Int
    let difficulty: String
    let gasLimit, gasUsed: Int
    let hash, miner, nonce, balance: String
    let blockNumber: Int
    let systemInfo: SystemInfo
    let blockTime: Int
    let avgBlockTime: Double
}

// MARK: - SystemInfo
struct SystemInfo: Codable {
    let name: String
    let peerCount: Int
    let isMining, isSyncing: Bool
    let coinbase, nodeVersion: String
    let hashRate: Int
    let nodeID: String

    enum CodingKeys: String, CodingKey {
        case name, peerCount, isMining, isSyncing, coinbase, nodeVersion, hashRate
        case nodeID = "nodeId"
    }
}

typealias PeerInfo = [PeerInfoElement]

extension PeerInfoElement {
    init? (dictionary: [String: Any]) throws {
        self = try JSONDecoder().decode(PeerInfoElement.self, from: JSONSerialization.data(withJSONObject: dictionary))
    }
   
}
