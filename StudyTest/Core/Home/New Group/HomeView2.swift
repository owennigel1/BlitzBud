//
//  HomeView2.swift
//  StudyTest
//
//  Created by Owen Nigel on 18/1/24.
//

import SwiftUI

struct HomeView2: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            ZStack {
                /*Color(hex: "#ADD8E6")
                    .ignoresSafeArea()
                 */
                //MapView()
                ZStack{
                    Color.white
                        .cornerRadius(60)
                        .shadow(color: .black, radius: 6, x: 0, y: -3)
                    VStack{
                        HStack{
                            Text("Welcome " + user.fullname)
                                .padding()
                                .font(.system(size: 23, weight: .semibold, design: .default))
                            Spacer()
                        }
                        .padding([.horizontal, .top], 20)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 348, height: 340)
                                .padding()
                                .padding(.bottom, 10)
                            VStack{
                                Image(systemName: "person.fill.xmark")
                                    .padding()
                                    .font(.system(size: 35))
                                    .foregroundColor(.gray)
                                Text("You have no current match")
                                    .font(.system(size: 17, weight: .regular, design: .default))
                                    .foregroundColor(.gray)
                            }
                            
                        }
                        .offset(y: -20)
                        
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            Label("MATCH", systemImage: "figure.socialdance")
                                .font(.system(size: 30))
                                .padding(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(.black, lineWidth: 2)
                                )
                                .background(Color(hex:"FFB700"))
                                .foregroundColor(.black)
                        }.offset(y:-25)
                        Spacer()
                    }
                }
                .offset(y: 170)
                //BottomBarView()
            }
        }
    }
}

#Preview {
    HomeView2()}
