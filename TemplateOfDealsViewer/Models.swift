//
//  Models.swift
//  TemplateOfDealsViewer
//
//  Created by Иван Тазенков on 03.02.2023.
//

import Foundation

// MARK: - Deal

struct Deal {
    let id: Int64
    let dateModifier: Date
    let instrumentName: String
    let price: Double
    let amount: Double
    let side: Side

    enum Side: String, CaseIterable {
        case sell = "Sell"
        case buy = "Buy"
    }
}

// MARK: - Sort

struct Sort {
    var direction: Direction = .up
    var field: Field = .date

    enum Direction: String {
        case down
        case up
    }

    enum Field: String {
        case date
        case instrument
        case price
        case amount
        case side
    }
}
