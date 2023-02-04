//
//  AppDelegate.swift
//  TemplateOfDealsViewer
//
//  Created by Artem Salimyanov on 07.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        let presenter = Presenter()

        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.view.backgroundColor = .systemBackground

        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()

        viewController.output = presenter
        presenter.view = viewController


        return true
    }
}
