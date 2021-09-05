// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let webThreeData = try? newJSONDecoder().decode(WebThreeData.self, from: jsonData)

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let webThreeData = try? newJSONDecoder().decode(WebThreeData.self, from: jsonData)

import Foundation

// MARK: - WebThreeData
struct WebThreeData: Codable {
    let latestAvgBlockTime: Double
    let latestDifficulty, latestBlockNumber: Int
    let lastBlockAt: String
    let difficultyHistory: [DifficultyHistory]
    let blockTimeHistory: [BlockHistory]
    
    var networkHashRate: Int {
        get{
            return Int(Double(latestDifficulty) / latestAvgBlockTime)
        }
    }
}

// MARK: - Block History
struct BlockHistory: Codable {
//    let avgBlockTime: String;
    let blockNumber: Int;
    let  blockTime: Int;
    let time: String;
}


// MARK: - Difficulty History

struct DifficultyHistory: Codable {
    let difficulty: Double;
    let time: String;
}



extension WebThreeData {
    init? (dictionary: [String: Any]) throws {
        self = try JSONDecoder().decode(WebThreeData.self, from: JSONSerialization.data(withJSONObject: dictionary))
    }
    
}

extension Double{
   

     func abbreviateNumber()-> String {
        let SI_SYMBOL = ["", "k", "M", "G", "T", "P", "E"];
      // what tier? (determines SI symbol)
        
        let tier = (Int(log10(abs(self))) / 3) | 0;

      // if zero, we don't need a suffix
        if (tier == 0) {
            return String(self)
            
        }

      // get suffix and determine scale
      let suffix = SI_SYMBOL[tier];
      let scale = pow(10, tier * 3);

      // scale the number
      let scaled = self / Double(truncating: scale as NSNumber);

      // format number and add suffix
      return "\(scaled)\(suffix)"
    }
}
