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
    
    var userProfile = UserProfileViewModel(
        name: "Agustina Behotas",
        age: "28",
        email: "agustina.behotas@gmail.com"
    )

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
            onSettings: { [weak self] in self?.showSettings() },
            userProfile: userProfile
        )
        
        profileView.userProfile.name = userProfile.name
        profileView.userProfile.age = userProfile.age
        profileView.userProfile.email = userProfile.email
        
        let hostingVC = UIHostingController(rootView: profileView)
        navigationController.pushViewController(hostingVC, animated: true)
    }
    
    func updateProfile() {
        let hostingVC = navigationController.topViewController as! UIHostingController<ProfileView>
        let profileView = hostingVC.rootView
        
        profileView.userProfile.name = userProfile.name
        profileView.userProfile.age = userProfile.age
        profileView.userProfile.email = userProfile.email
    }

    func showEditProfile() {
        let editVC = EditProfileViewController()
        
        editVC.nameTextField.text = userProfile.name
        editVC.ageTextField.text = userProfile.age
        editVC.emailTextField.text = userProfile.email
        
        editVC.onSave = { [weak self] updateProfile in
            self?.userProfile = updateProfile
            self?.navigationController.popViewController(animated: true)
            self?.updateProfile()
        }
        
        navigationController.pushViewController(editVC, animated: true)
    }

    func showSettings() {
        let settingsView = SettingsView()
        let hostingVC = UIHostingController(rootView: settingsView)
        navigationController.pushViewController(hostingVC, animated: true)
    }
}
