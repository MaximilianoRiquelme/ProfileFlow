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
    
    let settings = SettingsView()
    
    weak var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pagina Principal"
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        setUpNavigationBar()
        setupDescriptionLabel()
        setupGoToProfileButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //setupDescriptionLabel()
        //setupGoToProfileButton()
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
    
    func setupDescriptionLabel () {
        view.addSubview(descriptionLabel)
        descriptionLabel.text = "Esta es una aplicacion que demuestra los mecanismos de navegacion y pasaje de datos, entre vistas de los distintos frameworks UIKit y SwiftUI. Utilizando UIHostingController y UIViewControllerRepresentable para la navegacion."
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        
        // Position on view configuration.
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            descriptionLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            descriptionLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9)
        ])
    }
    
    func setupGoToProfileButton() {
        view.addSubview(goToProfileButton)
        
        // Appearance configuration.
        goToProfileButton.configuration = .bordered()
        goToProfileButton.configuration?.title = "Ir a Perfil"
        
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
        coordinator?.showProfile()
    }
}
