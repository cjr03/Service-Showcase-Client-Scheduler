import SwiftUI

@main
struct EstheticianApp: App {
    @StateObject private var authManager = AuthManager()
    @StateObject private var appointmentManager = AppointmentManager()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authManager)
                .environmentObject(appointmentManager)
                .preferredColorScheme(.light)
                .background(Color("PrimaryPink"))
        }
    }
}

struct RootView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        Group {
            if authManager.isAuthenticated {
                MainTabView()
            } else {
                OnboardingFlow()
            }
        }
        .accentColor(Color("PrimaryPink"))
    }
}
