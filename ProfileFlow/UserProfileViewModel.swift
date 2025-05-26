//
//  UserProfile.swift
//  ProfileFlow
//
//  Created by Maximiliano Riquelme Vera on 26/05/2025.
//

import Foundation
import SwiftUI

class UserProfileViewModel: ObservableObject {
    @Published var name: String
    @Published var age: String
    @Published var email: String
    
    init(name: String, age: String, email: String) {
        self.name = name
        self.age = age
        self.email = email
    }
}
