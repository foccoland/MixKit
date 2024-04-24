//
//  Event.swift
//  MixKit
//
//  Created by Fabio Giannelli on 28/09/23.
//

import Foundation

struct Event: Identifiable, Codable {
    let id: UUID?
    var title: String
}
