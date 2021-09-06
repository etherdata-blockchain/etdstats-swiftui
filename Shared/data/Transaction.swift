// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let transactionDetail = try? newJSONDecoder().decode(TransactionDetail.self, from: jsonData)

import Foundation

// MARK: - TransactionDetail
struct TransactionDetail: Codable {
    let status: String
    let block: BlockDetail
    let transaction: Transaction
}

// MARK: - Block
struct BlockDetail: Codable {
    let difficulty, extraData: String
    let gasLimit, gasUsed: Int
    let hash, logsBloom, miner, mixHash: String
    let nonce: String
    let number: Int
    let parentHash, receiptsRoot, sha3Uncles: String
    let size: Int
    let stateRoot: String
    let timestamp: Int
    let totalDifficulty: String
    let transactions: [String]
    let transactionsRoot: String
    let uncles: [String]
}

// MARK: - Transaction
struct Transaction: Codable {
    let blockHash: String
    let blockNumber: Int
    let from: String
    let gas: Int
    let gasPrice, hash, input: String
    let nonce: Int
    let to: String
    let transactionIndex: Int
    let value, type, v, r: String
    let s: String
    let time: String?
}

struct UserTransaction: Codable {
    let hash, from: String
    let gas: Int
    let gasPrice, lowercaseFrom, lowercaseTo, time: String
    let to, value: String
}



// MARK: - UserDetail
struct UserDetail: Codable {
    let balance: String
    let transactions: [UserTransaction]
}


// MARK: - Search Response

struct SearchResponse: Codable{
    let block: BlockDetail?
    let user: UserDetail?
    let transaction: TransactionDetail?
}

extension String{
    func toETD() -> Double{
        let value = Double(self) ?? 0
        return value / 100000000000000000;
    }
}
