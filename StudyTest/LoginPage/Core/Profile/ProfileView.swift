
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            VStack(alignment: .leading) {
                HStack{
                    Text(user.fullname)
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
                Text(user.bio)
                    .offset(x: 30)
                    .padding(.top, 15)
                    .frame(width: 330)
                    .multilineTextAlignment(.trailing)
                    .lineLimit(3)
                    
                Divider()
                    .overlay(.black)
                ScrollView {
                    HStack{
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("Name")
                            Text(user.fullname)
                                .textFieldStyle(OrangeTextFieldBackground())
                                .frame(width: 280)
                            
                            Text("Birthdate")
                            Text(user.birthdate)
                            //DateView()
                                .textFieldStyle(OrangeTextFieldBackground())
                                .frame(width: 280)
                            
                            Text("Gender")
                            Text(user.gender)
                                .textFieldStyle(OrangeTextFieldBackground())
                                .frame(width: 280)
                            Spacer()
                            
                            
                        }.offset(x: 30, y: 10)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 400)

                Button ("Sign out"){
                    viewModel.signOut()
                }
            }
            }
        }
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


#Preview {
    ProfileView()
}
