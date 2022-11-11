import SwiftUI

@main
struct FlowCoordinators: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
