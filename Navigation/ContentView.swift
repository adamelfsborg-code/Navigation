import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show me number: 32") {
                    path = [32]
                }
                Button("Show me number: 64") {
                    path.append(64)
                }
                
                Button("Show me 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("Moved to path \(selection)")
            }
        
        }
    }
}

#Preview {
    ContentView()
}
