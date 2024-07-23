import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, there")
                .toolbar {
                    ToolbarItemGroup(placement: .confirmationAction) {
                        Button("Tap me") {}
                        Button("Or me"){}
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
