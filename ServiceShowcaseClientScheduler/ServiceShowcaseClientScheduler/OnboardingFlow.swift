import SwiftUI

struct OnboardingFlow: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var currentStep: OnboardingStep = .welcome
    
    enum OnboardingStep {
        case welcome, genderVerification, authentication
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryPink")
                    .ignoresSafeArea()
                Group {
                    switch currentStep {
                    case .welcome:
                        WelcomeView(continueAction: {
                            currentStep = .genderVerification
                        })
                        
                    case .genderVerification:
                        GenderVerificationView(currentStep: $currentStep)
                        
                    case .authentication:
                        AuthView()
                    }
                }
                .transition(.opacity)
            }
        }
    }
}
