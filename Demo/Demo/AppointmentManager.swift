import SwiftUI
import Foundation

// Demo funcs in place of backend. (concept application)

class AppointmentManager: ObservableObject {
    @Published var availableServices = [
        Service(id: 1, name: "Eyebrow Wax and Mapping", duration: 45, price: 20),
        Service(id: 2, name: "Eyebrow Wax and Stain", duration: 70, price: 25),
        Service(id: 3, name: "Eyebrow Wax and Lamination", duration: 70, price: 25),
        Service(id: 4, name: "Eyebrow Wax, Lamination, and Strain", duration: 90, price: 35),
        Service(id: 5, name: "Rapid Spray Tan", duration: 30, price: 50),
        Service(id: 6, name: "Spray Tan", duration: 30, price: 40),
        Service(id: 7, name: "Underarm Sugar Waxing", duration: 30, price: 30),
        Service(id: 8, name: "Full Arm Sugar Waxing", duration: 45, price: 35),
        Service(id: 9, name: "Full Leg Sugar Waxing", duration: 45, price: 40),
        Service(id: 10, name: "Brazilian Sugar Waxing", duration: 60, price: 45),
    ]
    
    @Published var appointments: [Appointment] = []
    
    struct Service: Identifiable, Hashable {
        let id: Int
        let name: String
        let duration: Int
        let price: Double
    }
    
    struct Appointment: Identifiable, Hashable {
        let id: String
        let serviceId: Int
        let date: Date
        let clientName: String
        var isCompleted: Bool = false
    }
    
    func bookAppointment(serviceId: Int, date: Date, clientName: String) {
        let newAppointment = Appointment(
            id: UUID().uuidString,
            serviceId: serviceId,
            date: date,
            clientName: clientName
        )
        appointments.append(newAppointment)
    }
    
    func getService(byId id: Int) -> Service? {
        availableServices.first { $0.id == id }
    }
}
