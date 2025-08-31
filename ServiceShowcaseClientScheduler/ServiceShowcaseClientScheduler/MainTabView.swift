import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ServicesView()
                .tabItem {
                    Label("Services", systemImage: "sparkles")
                }
            
            SchedulingView()
                .tabItem {
                    Label("Book", systemImage: "calendar")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
        }
        .accentColor(Color(.black))
        .background(Color("PrimaryPink"))
    }
}
