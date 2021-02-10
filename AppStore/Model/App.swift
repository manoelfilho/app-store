//
//  App.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import Foundation

struct App: Decodable {
    
    let id: Int
    let nome: String
    let empresa: String
    let avaliacao: String?
    let iconeUrl: String
    let screenshotUrls: [String]?
    let descricao: String?
    let comentarios: [AppComment]?
    
}
