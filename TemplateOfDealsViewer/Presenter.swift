//
//  Presenter.swift
//  TemplateOfDealsViewer
//
//  Created by Иван Тазенков on 03.02.2023.
//

import Foundation

// MARK: - Presenter

final class Presenter {
    weak var view: ViewControllerInput!
    private let server = Server()
    private var deals = [Deal]()
    private var sort = Sort()

    func sortDeals() {
        deals.sort { prev, next in
            switch sort.field {
            case .date: return prev.dateModifier < next.dateModifier
            case .side: return prev.side.rawValue < next.side.rawValue
            case .amount: return prev.amount < next.amount
            case .price: return prev.price < next.price
            case .instrument: return prev.instrumentName < next.instrumentName
            }
        }

        switch sort.direction {
        case .up: deals.reverse()
        case .down: break
        }
    }
}

// MARK: ViewControllerOutput

extension Presenter: ViewControllerOutput {
    var headerSort: Sort {
        sort
    }

    var dealsCount: Int {
        deals.count
    }

    func dealForIndexPath(indexPath: IndexPath) -> Deal {
        deals[indexPath.row]
    }

    func viewDidLoad() {
        server.subscribeToDeals { [weak self] newDeals in
            self?.deals.append(contentsOf: newDeals)
            self?.sortDeals()
            self?.view.reload()
        }
    }

    func sortDidChange(sort: Sort) {
        self.sort = sort
        sortDeals()
    }
}
