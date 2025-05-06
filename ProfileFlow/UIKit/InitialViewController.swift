//
//  MainPage.swift
//  ProfileFlow
//
//  Created by Maximiliano Riquelme Vera on 06/05/2025.
//

import UIKit
import SwiftUI

class InitialViewController: UIViewController {
    
    let descriptionLabel = UILabel()
    let goToProfileButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Initial View"
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        setUpNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpDescriptionLabel()
        setupGoToProfileButton()
    }
    
    func setUpNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .secondarySystemBackground
         
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.compactAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationController?.navigationBar.compactScrollEdgeAppearance = navBarAppearance
    }
    
    func setUpDescriptionLabel () {
        view.addSubview(descriptionLabel)
        descriptionLabel.text = "This is a UIKit View, with the porpouse to show the navigation to another SwiftUI View, utilizing UIHostingController"
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        
        // Position on view configuration.
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            descriptionLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            descriptionLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9)
        ])
    }
    
    func setupGoToProfileButton() {
        view.addSubview(goToProfileButton)
        
        // Appearance configuration.
        goToProfileButton.configuration = .filled()
        goToProfileButton.configuration?.baseBackgroundColor = .systemTeal
        goToProfileButton.configuration?.title = "Go to Profile View"
        
        goToProfileButton.addTarget(self, action: #selector(goToProfileView), for: .touchUpInside)
        
        // Position on view configuration.
        goToProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goToProfileButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            goToProfileButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            goToProfileButton.widthAnchor.constraint(equalToConstant: 250),
            goToProfileButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func goToProfileView() {
        let profileView = ProfileView()
        let hostingController = UIHostingController(rootView: profileView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
