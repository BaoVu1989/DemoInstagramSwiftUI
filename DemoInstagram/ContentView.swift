//
//  ContentView.swift
//  DemoInstagram
//
//  Created by Bao Vu on 7/14/20.
//  Copyright © 2020 Bao Vu. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        
        TabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// This is a TabView....

struct TabView: View{
    
    @State var index = 0
    
    var body: some View{
        
        VStack{
            
            Home()
            
            
            
            Divider()
            
            HStack{
                
                // This is a Home button...
                Button(action: {
                    self.index = 0
                }) {
                    Image("home")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 0 ? .blue : .black)
                        
                    
                }
                
                Spacer(minLength: 0)
                
                // This is a Search button...
                Button(action: {
                    self.index = 1
                }) {
                    Image("search")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 1 ? .blue : .black)
                }
                
                Spacer(minLength: 0)
                
                // This is a Upload button...
                Button(action: {
                    self.index = 2
                }) {
                    Image("plus")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 2 ? .blue : .black)
                }
                
                Spacer(minLength: 0)
                
                // This is a like button...
                Button(action: {
                    self.index = 3
                }) {
                    Image("heart")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 3 ? .blue : .black)
                }
                
                Spacer(minLength: 0)
                
                // This is a Profile button...
                Button(action: {
                    self.index = 4
                }) {
                    Image("person")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 4 ? .blue : .black)
                    
                }
            }.padding(.vertical, 10)
                .padding(.horizontal)
        }
    }
}

// This is a Home View....

struct Home: View {
    
    var body: some View{
        
        VStack{

            ZStack{

                HStack{

                    // This is a Taking Photo button..

                    Button(action: {

                    }) {
                        Image("camera")
                        .resizable()
                        .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }

                    Spacer()

                    // This is a Send button..

                    Button(action: {

                    }) {
                        Image("email")
                        .resizable()
                        .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }

                }.padding()

                Text("Instagram")
                    .font(.title)
                    .fontWeight(.bold)
            }

            Divider()
            
            // Middle View....
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack{
                            ForEach(0..<6){_ in
                                
                                VStack(spacing: 10){
                                    StatusCard(imgName: "people")
                                    Text("Your Story")
                                        .font(.footnote)
                                }.padding()
                            }
                        }
                    }
                    
                    Divider()
                    
                    ForEach(0..<8){_ in
                        
                       postCard(user: "", image: "", id: "")
                        
                        Divider()
                        
                    }
                }
            }
        
        }
    }
}

// This is a StatusCard...

struct StatusCard : View {
    
    var imgName = ""
    
    var body: some View {
        
        Image(imgName)
        .resizable()
        .frame(width: 50, height: 50)
        .clipShape(Circle())
            .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [.red,.orange]), startPoint: .bottom, endPoint: .top), lineWidth: 3))
    }
}

// This is a postCart...

struct postCard : View{
    
    var user = ""
    var image = ""
    var id = ""
    
    var body : some View{
        
        VStack{
            
            HStack{
                
                Button(action: {
                    
                }) {
                    HStack{
                        Image("home")
                        .resizable()
                        .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        Text("User")
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("menu")
                    .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                
            }.padding()
            
            Image("heart").frame(height: 300)
            
            HStack{
                
                Button(action: {
                    
                }) {
                    Image("heart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
                }
                
                
                
                Button(action: {
                    
                }) {
                    Image("comment")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
                }
                
                
                
                Button(action: {
                    
                }) {
                    Image("email")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("save")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
                }
                
            }.padding()
            
        }
        
    }
}
