//
//  SwiftUIView.swift
//  StudyTest
//
//  Created by Owen Nigel on 19/1/24.
//

import SwiftUI

struct DateView: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var birthDate = Date()

    var body: some View {
        HStack{
            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                Text("date")
            }
            .labelsHidden()
            Spacer()
        }
        //.offset(x:30)
    }

}

#Preview {
    DateView()
}
