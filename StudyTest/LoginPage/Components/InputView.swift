
import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: 12){
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(Font.custom("Segoe", size: 14))

            if isSecureField{
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding(20)
                    .frame(width: 292, height: 46)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding(20)
                    .frame(width: 292, height: 46)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
            
        }
    }
}

    
struct InputView_Previews: PreviewProvider {
    static var previews: some View{
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}

