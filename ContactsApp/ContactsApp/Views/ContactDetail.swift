//
//  ContactDetail.swift
//  ContactsApp
//
//  Created by Vu Cao Nguyen on 14/10/26.
//

import Foundation
import SwiftUI

struct ContactDetail: View {
    @Binding var contact: Contact
    @State private var showEdit = false
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.secondary)
            
            Text(contact.name)
                .font(.title)
                .bold()
            
            Text(contact.phone)
                .font(.title3)
                .foregroundStyle(.secondary)
            
            Spacer()
            
        }
        .padding(.top, 32)
        .navigationTitle("Tiêu đề")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Sửa") { showEdit = true }
            }
        }
        .sheet(isPresented: $showEdit) {
            EditContactView(contact: $contact)
        }
    }
}
