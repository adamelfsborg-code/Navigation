import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) {i in
                    Text("row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.indigo)
            .toolbarColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
