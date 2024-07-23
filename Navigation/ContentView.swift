import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        VStack {
            
            NavigationLink("You selected number: \(number)", value: Int.random(in: 0...1000))
                .navigationTitle("Num - \(number)")
                .toolbar {
                    Button("Reset") {
                        path.removeAll()
                    }
                }
        }
        
    }
}

struct ContentView: View {
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { selection in
                    DetailView(number: selection, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
