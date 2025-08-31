import SwiftUI

struct WelcomeView: View {
    let continueAction: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "sparkles")
                .font(.system(size: 80))
                .foregroundColor(Color("BackgroundPink"))
            
            Text("Welcome to\nHer Beauty")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Professional eyebrow, tanning, and sugar wax services designed by women, for women.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
            
            Button(action: continueAction) {
                Text("Get Started")
                    .frame(width: 200)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding()
        .background(Color("PrimaryPink"))
    }
}

