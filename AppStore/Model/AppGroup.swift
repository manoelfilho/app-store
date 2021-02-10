//
//  AppGroup.swift
//  AppStore
//
//  Created by Manoel Filho on 30/01/21.
//

import Foundation


struct AppGroup: Decodable {
    let id: String
    let titulo: String
    let apps: [App]
}
