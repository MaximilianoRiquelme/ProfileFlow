//
//  ProfileView.swift
//  ProfileFlow
//
//  Created by Agustina Behotas on 06/05/2025.
//
import Foundation
import SwiftUI

struct ProfileView: View {
    var onEditProfile: (() -> Void)?
    var onSettings: (() -> Void)?
    
    @ObservedObject var userProfile: UserProfileViewModel
    
    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top, 40)

            VStack(spacing: 8) {
                Text(userProfile.name)
                    .font(.title2)
                    .bold()
                Text(userProfile.age)
                Text(userProfile.email)
            }

            Spacer()

            Button("Editar perfil") {
                onEditProfile?()
            }
            .buttonStyle(.bordered)

            Button("Configuración") {
                onSettings?()
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
        .navigationTitle("Perfil")
    }
}

/*
 Wrapper for EditProfileViewController, in order to be presented by SwiftUI framework.
 */
struct EditProfileVCRepresentable : UIViewControllerRepresentable {

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }

    func makeUIViewController(context: Context) -> EditProfileViewController {
        let viewController = EditProfileViewController()
        return viewController
    }
}

