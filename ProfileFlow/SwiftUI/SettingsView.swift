//
//  SettingsView.swift
//  ProfileFlow
//
//  Created by Agustina Behotas on 15/05/2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Text("Versión: 1.0.0")
                    Text("Licencia: MIT")
                }

                Button("Cerrar") {
                    dismiss()
                }
                .foregroundColor(.red)
            }
            .navigationTitle("Configuración")
        }
    }
}

#Preview {
    SettingsView()
}
