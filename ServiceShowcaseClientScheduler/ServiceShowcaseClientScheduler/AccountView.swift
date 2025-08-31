import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var appointmentManager: AppointmentManager
    
    var body: some View {
        NavigationStack {
            List {
                Section("My Info") {
                    if let user = authManager.user {
                        Text(user.name)
                        Text(user.email)
                    }
                }
                
                Section("Upcoming Appointments") {
                    ForEach(appointmentManager.appointments) { appointment in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(appointmentManager.getService(byId: appointment.serviceId)?.name ?? "Unknown Service")
                                    .font(.headline)
                                Text(appointment.date.formatted(date: .abbreviated, time: .shortened))
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: appointment.isCompleted ? "checkmark.circle.fill" : "clock")
                        }
                    }
                }
                
                Section {
                    Button("Log Out") {
                        authManager.logout()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("My Account")
            .scrollContentBackground(.hidden)
            .background(Color("PrimaryPink"))
        }
    }
}
