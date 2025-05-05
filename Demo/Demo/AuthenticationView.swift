import SwiftUI

struct AuthView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) var dismiss
    @State private var isLoginMode = true
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Picker(selection: $isLoginMode, label: Text("Auth Mode")) {
                Text("Login")
                    .tag(true)
                Text("Create Account")
                    .tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if !isLoginMode {
                TextField("Full Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.words)
            }
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: handleAuth) {
                Text(isLoginMode ? "Log In" : "Create Account")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1 : 0.5)
            
            Spacer()
        }
        .padding()
        .background(Color("PrimaryPink"))
        .navigationTitle(isLoginMode ? "Log In" : "Sign Up")
        .alert("Authentication Error", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
    
    private var formIsValid: Bool {
        if isLoginMode {
            return !email.isEmpty && email.contains("@") && !password.isEmpty
        } else {
            return !name.isEmpty && !email.isEmpty && email.contains("@") && password.count >= 8
        }
    }
    
    private func handleAuth() {
        if isLoginMode {
            authManager.login(email: email, password: password) { success in
                if !success {
                    alertMessage = "Invalid credentials"
                    showingAlert = true
                }
            }
        } else {
            authManager.signUp(name: name, email: email, password: password) { success in
                if !success {
                    alertMessage = "Registration failed"
                    showingAlert = true
                }
            }
        }
    }
}

