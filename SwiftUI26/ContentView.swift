//
//  ContentView.swift
//  SwiftUI26
//
//  Created by Rohit Saini on 05/08/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI
import RealmSwift
struct ContentView: View {
    @State var name = ""
    @State var age = ""
    var body: some View {
        VStack{
            TextField("Name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Age", text: $age).textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                let config = Realm.Configuration(schemaVersion: 1)
                do{
                    let realm = try Realm(configuration: config)
                    let newuser = User()
                    newuser.name = self.name
                    newuser.age = self.age
                    try realm.write({
                        realm.add(newuser)
                        print("added")
                    })
                    
                }
                catch{
                    print(error)
                }
                
            }) {
                Text("Save").fontWeight(.heavy)
            }
            Button(action: {
                let config = Realm.Configuration(schemaVersion: 1)
                do{
                   let realm = try Realm(configuration: config)
                    let result = realm.objects(User.self)
                    print(result)
                }
                catch{
                    print(error)
                }
                
            }) {
                Text("Display").fontWeight(.heavy)
            }
            
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class User: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var age: String = ""
}
