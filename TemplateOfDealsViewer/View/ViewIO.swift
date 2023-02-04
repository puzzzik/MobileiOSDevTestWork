//
//  ViewIO.swift
//  TemplateOfDealsViewer
//
//  Created by Иван Тазенков on 03.02.2023.
//

import Foundation

// MARK: - ViewControllerInput

protocol ViewControllerInput: AnyObject {
    func reload()
}

// MARK: - ViewControllerOutput

protocol ViewControllerOutput: AnyObject {
    var dealsCount: Int { get }
    var headerSort: Sort { get }
    func viewDidLoad()
    func dealForIndexPath(indexPath: IndexPath) -> Deal
    func sortDidChange(sort: Sort)
}
