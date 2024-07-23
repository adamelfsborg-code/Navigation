import SwiftUI

struct DetailView: View {
    let person: Person
    
    var body: some View {
        Text("\(person.name)")
    }
    
    init(person: Person) {
        print("Creating detail view for: \(person.id)")
        self.person = person
    }
}

struct Person: Hashable, Identifiable {
    let id = UUID()
    var name: String
}

struct ContentView: View {
    @State var persons = [Person]()
    var body: some View {
        NavigationStack {
            List(persons) { person in
                NavigationLink("Tap row \(person.name)", value: person)
            }
            .navigationDestination(for: Person.self) { selection in
                DetailView(person: selection)
            }
            .toolbar {
                Button("Add person") {
                    let p = Person(name: "Adam \(Int.random(in: 1..<10))")
                    persons.insert(p, at: 0 )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
