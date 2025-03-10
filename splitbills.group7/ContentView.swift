//
//  ContentView.swift
//  splitbills.group7
//
//  Created by Muhamad Gatot Supiadin on 10/03/25.
//

import SwiftUI


struct ContentView: View {
    
    @State var person: String = ""
    @State var friends: [(name: String, color: Color)] = []
    
    // add friends
    func addFriend() {
        if !person.isEmpty {
            
            let randomColor = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1)
            )
            
            friends.append((name: person, color: randomColor))
            person = ""
        }
    }

    var body: some View {
        
        NavigationStack{
            
            VStack {
                
                Spacer()
                
                HStack{
                    TextField("Enter your friend's name", text: $person)
                        .frame(height: 35)
                        .foregroundColor(.black)
                        .autocapitalization(.none)
                        .background(Color.clear)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            addFriend()
                        }
                    Button("Add"){
                        addFriend()
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 35)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .border(Color.blue, width: 1)
                    .cornerRadius(10) // Rounded corners
                    .fontWeight(.bold)
                    
                }.padding()
                
                VStack{
                    
                    List(friends, id: \.name){ friend in
                        HStack {
                            Circle()
                                .fill(friend.color)
                                .frame(width: 20, height: 20)
                            Text(friend.name)
                        }
                    }
                }
                            
                Spacer()
                Text("Total friends: \(friends.count)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
                
                NavigationLink(destination: SplitDetailsView()){
                    HStack{
                        Text("Next")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                        Image(systemName: "arrow.right")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.blue.opacity(0.5))
            
        }
    }
}

#Preview {
    ContentView()
}
