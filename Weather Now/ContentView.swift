//
//  ContentView.swift
//  Weather Now
//
//  Created by Dmitrii Pogonia on 01.04.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.name) private var friends: [Friend] = [
        Friend(name: "Dima", birthday: .now), Friend(name: "John", birthday: Date(timeIntervalSince1970: 0))
    ]
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
            
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
