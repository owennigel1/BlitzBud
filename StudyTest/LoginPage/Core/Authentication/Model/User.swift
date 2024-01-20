
import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let bio: String
    let birthdate: String
    let gender: String
    
    /*var intitials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }*/
}
