import SwiftUI

struct SchedulingView: View {
    @EnvironmentObject var appointmentManager: AppointmentManager
    @EnvironmentObject var authManager: AuthManager
    @State private var selectedService: AppointmentManager.Service?
    @State private var selectedDate = Date()
    @State private var showingConfirmation = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select Service") {
                    Picker("Service", selection: $selectedService) {
                        Text("Choose a service").tag(nil as AppointmentManager.Service?)
                        ForEach(appointmentManager.availableServices) { service in
                            Text(service.name).tag(Optional(service))
                        }
                    }
                }
                
                Section("Select Date & Time") {
                    DatePicker("Appointment Time",
                              selection: $selectedDate,
                              in: Date()...,
                              displayedComponents: [.date, .hourAndMinute])
                }
                
                Section {
                    Button("Book Appointment") {
                        bookAppointment()
                    }
                    .disabled(selectedService == nil)
                }
            }
            .navigationTitle("New Appointment")
            .scrollContentBackground(.hidden)
            .background(Color("PrimaryPink"))
            .alert("Booked!", isPresented: $showingConfirmation) {
                Button("OK") { }
            } message: {
                Text("Your \(selectedService?.name ?? "appointment") is confirmed!")
            }
        }
    }
    
    private func bookAppointment() {
        guard let service = selectedService else { return }
        appointmentManager.bookAppointment(
            serviceId: service.id,
            date: selectedDate,
            clientName: authManager.user?.name ?? "Guest"
        )
        showingConfirmation = true
    }
}
