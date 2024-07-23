import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(1..<5) { i in
                    NavigationLink("Select number: \(i)", value: i)
                }
                ForEach(1..<5) { i in
                    NavigationLink("Select string: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push random number") {
                    path.append(Int.random(in: 0...1000))
                }
                
                Button("Push random string") {
                    path.append(String(Int.random(in: 0...1000)))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected string \(selection)")
            }
        
        }
    }
}

#Preview {
    ContentView()
}
