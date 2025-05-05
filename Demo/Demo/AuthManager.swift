import SwiftUI
import Foundation

// Demo funcs in place of backend. (concept application)

class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var user: Client?
    @Published var genderVerified = false
    
    struct Client {
        let id: String
        let name: String
        let email: String
        let gender: String
    }
    
    func verifyGender(isFemale: Bool) {
        genderVerified = isFemale
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.user = Client(
                id: UUID().uuidString,
                name: "Demo User",
                email: email,
                gender: "female"
            )
            self.isAuthenticated = true
            completion(true)
        }
    }
    
    func signUp(name: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.user = Client(
                id: UUID().uuidString,
                name: name,
                email: email,
                gender: "female"
            )
            self.isAuthenticated = true
            completion(true)
        }
    }
    
    func logout() {
        user = nil
        isAuthenticated = false
        genderVerified = false
    }
}
