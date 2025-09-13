//
//  Model1.swift
//  Exam1
//
//  Created by Tejasv Singh on 9/12/25.
//




struct DetailModel: Codable {
    let title: String?
    let arr: [transcodings]
    enum CodingKeys: String, CodingKey {
           case title
           case arr = "transcodings"
       }
}
struct transcodings: Codable {
    let id: String?
    let title: String?
    let height: Int?
}

