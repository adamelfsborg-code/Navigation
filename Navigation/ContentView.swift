import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.applicationDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
       path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else {return }
        do {
            let data = try? JSONEncoder().encode(representation)
            try data?.write(to: savePath)
        } catch {
           print("Failed to save data.")
        }
    }
}

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            
            NavigationLink("You selected number: \(number)", value: Int.random(in: 0...1000))
                .navigationTitle("Num - \(number)")
                .toolbar {
                    Button("Reset") {
                        path = NavigationPath()
                    }
                }
        }
        
    }
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self) { selection in
                    DetailView(number: selection, path: $pathStore.path)
                }
        }
    }
}

#Preview {
    ContentView()
}
