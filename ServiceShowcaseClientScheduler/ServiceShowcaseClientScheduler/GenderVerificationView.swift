import SwiftUI

struct GenderVerificationView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var isFemale = false
    @Binding var currentStep: OnboardingFlow.OnboardingStep
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 60))
                .foregroundColor(Color("BackgroundPink"))
            
            Text("Our Services Are Exclusively For Women")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            HStack {
                Image(systemName: isFemale ? "checkmark.square.fill" : "square")
                    .foregroundColor(isFemale ? Color("BackgroundPink") : .gray)
                Text("I am female")
                    .foregroundColor(.black)
            }
            .onTapGesture {
                isFemale.toggle()
                authManager.verifyGender(isFemale: isFemale)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            Spacer()
            
            Button(action: {
                currentStep = .authentication
            }) {
                Text("Continue")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(!isFemale)
            .opacity(isFemale ? 1.0 : 0.5)
            
        }
        .padding()
        .background(Color("PrimaryPink"))
        .navigationTitle("Verification")
        .navigationBarTitleDisplayMode(.inline)
    }
}
