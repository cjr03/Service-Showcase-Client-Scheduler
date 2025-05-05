import SwiftUI

struct ServicesView: View {
    @EnvironmentObject var appointmentManager: AppointmentManager
    
    var body: some View {
        NavigationStack {
            List(appointmentManager.availableServices) { service in
                NavigationLink {
                    ServiceDetailView(service: service)
                        .background(Color("PrimaryPink"))
                } label: {
                    HStack {
                        Image(systemName: "sparkles")
                            .foregroundColor(Color("BackgroundPink"))
                        Text(service.name)
                        Spacer()
                        Text(service.price, format: .currency(code: "USD"))
                    }
                }
            }
            .navigationTitle("Services")
            .scrollContentBackground(.hidden)
            .background(Color("PrimaryPink"))
        }
    }
}

struct ServiceDetailView: View {
    let service: AppointmentManager.Service
    
    var body: some View {
        Form {
            Section {
                Text(service.name)
                    .font(.title)
                Text("Duration: \(service.duration) minutes")
                Text(service.price, format: .currency(code: "USD"))
            }
            
            Section("Description") {
                Text("Sample description for \(service.name). Professional service performed by certified estheticians.")
            }
        }
        .navigationTitle("Service Details")
        .scrollContentBackground(.hidden)
        .background(Color("PrimaryPink"))
    }
}

