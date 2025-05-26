//
//  EditProfile.swift
//  ProfileFlow
//
//  Created by Maximiliano Riquelme Vera on 13/05/2025.
//


import UIKit

class EditProfileViewController: UIViewController {
    
    var onSave: ((UserProfileViewModel) -> Void)?
    
    let titleLabel = UILabel()
    let profileImageView = UIImageView()
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let ageTextField = UITextField()
    let saveButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        setupTitleLabel()
        setupProfileImageView()
        setupNameTextField()
        setupEmailTextField()
        setupAgeTextField()
        setupSaveButton()
        setupLayout()
        setupActions()
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Editar Perfil"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
    }
    
    func setupProfileImageView() {
        profileImageView.image = UIImage(systemName: "person.crop.circle")
        profileImageView.tintColor = .gray
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.isUserInteractionEnabled = true
        view.addSubview(profileImageView)
    }
    
    func setupNameTextField() {
        nameTextField.placeholder = "Nombre"
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
    }
    
    func setupEmailTextField() {
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        view.addSubview(emailTextField)
    }
    
    func setupAgeTextField() {
        ageTextField.placeholder = "Age"
        ageTextField.borderStyle = .roundedRect
        view.addSubview(ageTextField)
    }
    
    func setupSaveButton() {
        saveButton.setTitle("Guardar", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        saveButton.backgroundColor = .systemBlue
        saveButton.tintColor = .white
        saveButton.layer.cornerRadius = 10
        view.addSubview(saveButton)
    }
    
    func setupLayout() {
        // Disable autoresizing masks for everything.
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Utilizing top and bottom anchor points (plus a constant) to make every ui element trail vertically one after another, starting from the title anchored to the top of the safe area.
        NSLayoutConstraint.activate([
            // Title
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Profile
            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Name
            nameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Age
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            ageTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            // Email
            emailTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: ageTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: ageTextField.trailingAnchor),
            
            // Save Button. Anchor point fixed to the bottom of the safe area.
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Circular image
        profileImageView.layer.cornerRadius = 50
    }
    
    func setupActions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImageView.addGestureRecognizer(tapGesture)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // Mocked. TODO: Should open a UIImagePickerController.
    @objc private func profileImageTapped() {
    }
    
    // Mocked. TODO: Should pass the data back to the SwiftUI view so it can be updated, as pressing the save button is confirmation of this action, otherwise the changes can be discarted.
    @objc private func saveButtonTapped() {
        // Create a new profile with updated data.
        let updateProfile = UserProfileViewModel(
            name: nameTextField.text ?? "",
            age: ageTextField.text ?? "",
            email: emailTextField.text ?? ""
        )
        
        // Passes the updated profile data back to the coordinator.
        onSave?(updateProfile)
    }
}
