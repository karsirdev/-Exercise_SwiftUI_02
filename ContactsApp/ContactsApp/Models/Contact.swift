//
//  Contact.swift
//  ContactsApp
//
//  Created by Vu Cao Nguyen on 14/10/26.
//

import Foundation
import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    var name: String
    var phone: String
}

struct ContentView: View {
    @State private var contacts: [Contact] = [
        Contact(name: "An", phone: "0987654321"),
        Contact(name: "Binh", phone: "0123456789")
    ]
    
    var body: some View {
        NavigationStack {
            List($contacts) { $contact in
                NavigationLink {
                    ContactDetailView(contact: $contact)
                }
            }
        }
    }
}
