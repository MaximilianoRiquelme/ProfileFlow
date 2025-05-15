//
//  ProfileView.swift
//  ProfileFlow
//
//  Created by Agustina Behotas on 06/05/2025.
//

import SwiftUI

struct ProfileView: View {
    var onEditProfile: (() -> Void)?
    
    @State var isPresentingEditProfile = false
    @State private var isPresentingSettings = false
    
    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top, 40)

            VStack(spacing: 8) {
                Text("Agustina Behotas")
                    .font(.title2)
                    .bold()
                Text("Edad: 28")
                Text("agus@email.com")
            }

            Spacer()

            Button("Editar perfil") {
                isPresentingEditProfile = true
                onEditProfile?()
            }
            .buttonStyle(.bordered)

            Button("Configuración") {
                isPresentingSettings = true
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
        .navigationTitle("Perfil")
        .sheet(isPresented: $isPresentingEditProfile) {
                    EditProfileVCRepresentable()
        }
        .sheet(isPresented: $isPresentingSettings) {
                   SettingsView()
        }
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

#Preview {
    NavigationView {
        ProfileView()
    }
}

