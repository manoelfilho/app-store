//
//  AppComment.swift
//  AppStore
//
//  Created by Manoel Filho on 04/02/21.
//

import Foundation

struct AppComment: Decodable {
    let id: Int
    let titulo: String
    let avaliacao: Int
    let descricao: String?
}
