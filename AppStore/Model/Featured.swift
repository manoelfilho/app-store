//
//  Featured.swift
//  AppStore
//
//  Created by Manoel Filho on 30/01/21.
//

import Foundation

struct FeaturedApp: Decodable {
    
    let id: Int
    let nome: String
    let empresa: String
    let imagemURL: String
    let descricao: String
    
}
