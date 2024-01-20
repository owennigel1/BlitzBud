

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var bio = ""
    @State private var birthdate = ""
    @State private var gender = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            /*Image("loginLogo")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 120)
                .padding(.vertical, 32)*/
            
            VStack(spacing: 20) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Enter your name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)

               ZStack (alignment: .trailing){
                    InputView(text: $confirmPassword,
                              title: "Re-enter Password",
                              placeholder: "Confirm your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
                
                InputView(text: $bio,
                          title: "Bio",
                          placeholder: "Enter your bio")
                
                InputView(text: $birthdate,
                          title: "Birth Date",
                          placeholder: "Enter your Date of Birth")
                
                VStack (alignment: .leading, spacing: 12){
                    Text("What is your Gender?")
                        .foregroundColor(Color(.darkGray))
                        .fontWeight(.semibold)
                        .font(Font.custom("Segoe", size: 14))
                    
                    HStack {
                        if gender != "" {Text(gender)
                                .foregroundColor(Color(.darkGray))
                                .fontWeight(.semibold)
                                .font(Font.custom("Segoe", size: 14))
                        } else {
                            Text("Enter your gender")
                                .foregroundColor(Color(.lightGray))
                                .fontWeight(.semibold)
                                .font(Font.custom("Segoe", size: 14))
                        }
                            
                        Spacer()
                        
                        Menu {
                            Section("Gender"){
                                Button("Others"){gender = "Others"}
                                Button("Female"){gender = "Female"}
                                Button("Male"){gender = "Male"}
                                
                            }
                        } label: {
                            Label("", systemImage: "ellipsis.circle")
                        }
                    }
                    .font(.system(size: 14))
                    .padding(20)
                    .frame(width: 292, height: 46)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task{
                    try await viewModel.createUser(withEmail: email, 
                                                   password: password,
                                                   fullname: fullname,
                                                   bio: bio,
                                                   birthdate: birthdate,
                                                   gender: gender)
                }
                
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: 292, height: 46)
            }
            .background(Color(hex: 0x797EF6))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

    struct RegistrationView_Preview: PreviewProvider {
        static var previews: some View {
            RegistrationView()
        }
    }

//MARK - AuthenticationFormProtocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
}
