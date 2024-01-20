//
//  ProfileView.swift
//  StudyTest
//
//  Created by Owen Nigel on 18/1/24.
//

import SwiftUI

class ggUser: ObservableObject {
    @Published var name = "FunnyEgg92"
}

struct ProfileView: View {
    @State private var Bio: String = ""
    @State private var birthdate: String = ""
    @State private var schoolName: String = ""
    @State private var course: String = ""
    @State private var gender: String = ""
    @State private var question: String = ""
    @StateObject var name = User()

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(self.name.name)
                    .foregroundStyle(.black)
                    .padding(13)
                    .font(.system(size: 23, weight: .semibold, design: .default))
                    .background(Color(hex: "FFB700"))
                    .clipShape(Capsule())
                    .offset(x: 30, y: 20)
                Spacer()
            }.padding(.bottom,30)
            HStack{
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(x:-60)
                    .foregroundColor(.gray)
            }
            HStack{
                Text("Bio")
                    .foregroundStyle(.black)
                    //.padding(13)
                    .font(.system(size: 23, weight: .regular, design: .default))
                    .offset(x: 30)
            }
            TextField("Tell us something about yourself !", text: $Bio, axis: .vertical)
                .offset(x: 30)
                .padding(.top, 15)
                .frame(width: 330)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .lineLimit(3)
                
            Divider()
                .overlay(.black)
            ScrollView {
                HStack{
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Name")
                        TextField("Enter your name", text: $name.name)
                            .textFieldStyle(OrangeTextFieldBackground())
                            .frame(width: 280)
                        
                        Text("Birthdate")
                        DateView()
                            .textFieldStyle(OrangeTextFieldBackground())
                            .frame(width: 280)
                        
                        Text("School name")
                        TextField("Enter your school name", text: $schoolName)
                            .textFieldStyle(OrangeTextFieldBackground())
                            .frame(width: 280)
                        
                        Text("Course")
                        TextField("Enter your course", text: $course)
                            .textFieldStyle(OrangeTextFieldBackground())
                            .frame(width: 280)
                        
                        Text("Gender")
                        TextField("Enter your gender", text: $gender)
                            .textFieldStyle(OrangeTextFieldBackground())
                            .frame(width: 280)
                        Spacer()
                        
                        
                    }.offset(x: 30, y: 10)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
            Spacer()
            
        }
    }
}

#Preview {
    ProfileView()
}

struct OrangeTextFieldBackground: TextFieldStyle {
    
    // Hidden function to conform to this protocol
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(Color.orange)
                .frame(height: 40)
            
            HStack {
                // Reference the TextField here
                configuration
            }
            .padding(.leading)
            //.foregroundColor(.gray)
        }
    }
}
