//
//  ContentView.swift
//  StudyTest
//
//  Created by Owen Nigel on 17/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var name: String
    
    var body: some View {
        ZStack {
            Color(hex: "#ADD8E6")
                .ignoresSafeArea()
            ZStack{
                Color.white
                    .cornerRadius(60)
                    .shadow(color: .black, radius: 6, x: 0, y: -3)
                VStack{
                    HStack{
                        Text("Test Hi")
                            .padding()
                            .font(.system(size: 23, weight: .semibold, design: .default))
                        Spacer()
                    }
                    .padding([.horizontal, .top], 20)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 348, height: 155)
                            .padding()
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
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 348, height: 155)
                            .padding()
                        VStack{
                            Text("What are you looking for :")
                                .font(.system(size: 17, weight: .regular, design: .default))
                                .offset(x:-50, y:-20)
                                .frame(alignment: .leading)
                            HStack{
                                Spacer()
                                Button(action: {
                                    // Action to perform when the button is tapped
                                }) {
                                    Image(systemName: "pencil")
                                        .font(.system(size: 30))
                                        .padding(4)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 7)
                                                .stroke(.black, lineWidth: 2)
                                        )
                                        .foregroundColor(.black)
                                }.offset(x: -70)
                            }
                        }
                        
                    }
                    .offset(y: -38)
                    
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
                    }.offset(y:-20)
                    Spacer()
                }
            }
            .offset(y: 170)
            //BottomBarView()
        }
    }
}

#Preview {
    HomeView(name: .constant("Hi"))
}

