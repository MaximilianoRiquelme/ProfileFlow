//
//  AppCoordinator.swift
//  ProfileFlow
//
//  Created by Agustina Behotas on 20/05/2025.
//

import UIKit
import SwiftUI

class AppCoordinator {
    let window: UIWindow
    let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.window.rootViewController = navigationController
    }

    func start() {
        let initialVC = InitialViewController()
        initialVC.coordinator = self
        navigationController.setViewControllers([initialVC], animated: false)
        window.makeKeyAndVisible()
    }

    func showProfile() {
        let profileView = ProfileView(
            onEditProfile: { [weak self] in self?.showEditProfile() },
            onSettings: { [weak self] in self?.showSettings() }
        )
        let hostingVC = UIHostingController(rootView: profileView)
        navigationController.pushViewController(hostingVC, animated: true)
    }

    func showEditProfile() {
        let editVC = EditProfileViewController()
        navigationController.pushViewController(editVC, animated: true)
    }

    func showSettings() {
        let settingsView = SettingsView()
        let hostingVC = UIHostingController(rootView: settingsView)
        navigationController.pushViewController(hostingVC, animated: true)
    }
}
