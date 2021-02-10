//
//  FeaturedApp.swift
//  AppStore
//
//  Created by Manoel Filho on 30/01/21.
//

import Foundation

struct FeaturedApp: Decodable {
    
    let id: Int
    let nome: String
    let empresa: String
    let imagemUrl: String
    let descricao: String
    
}
