//
//  EditContact.swift
//  ContactsApp
//
//  Created by Vu Cao Nguyen on 14/10/26.
//

import SwiftUI

struct EditContactView: View {
    @Binding var contact: Contact
    @State private var draft: Contact
    @Environment(\.dismiss) private var dismiss

    init(contact: Binding<Contact>) {
        _contact = contact
        _draft = State(initialValue: contact.wrappedValue)
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Tên", text: $draft.name)
                TextField("Số điện thoại", text: $draft.phone)
                    .keyboardType(.phonePad)
            }
            .navigationTitle("Sửa liên hệ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Hủy") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Lưu") {
                        contact = draft
                        dismiss()
                    }
                    .disabled(draft.name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}
