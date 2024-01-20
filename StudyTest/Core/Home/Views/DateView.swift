//
//  SwiftUIView.swift
//  StudyTest
//
//  Created by Owen Nigel on 19/1/24.
//

import SwiftUI
import Foundation

struct DateView: View{
    @State private var date = Date()
    @State private var birthDate = ""
    
    var body: some View {
        VStack {
            DatePicker(selection: $date,in: ...Date(), displayedComponents: .date){}
            //.datePickerStyle(GraphicalDatePickerStyle()) // Use graphical style for calendar input
            .padding()
        }
    }

    func formattedDateString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy/MM/dd"
        return dateFormatter.string(from: date)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
