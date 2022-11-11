import SwiftUI

open class CoverFlowState: ObservableObject {
    @Published var coverPath = NavigationPath()
    @Published var presentedItem: CoverLink?
}

struct CoverFlowCoordinator<Content: View>: View {

    @ObservedObject var state: CoverFlowState
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.coverPath) {
            content()
                .sheet(item: $state.presentedItem, content: sheetContent)
                .navigationDestination(for: CoverLink.self, destination: linkDestination)
        }
    }

    @ViewBuilder private func linkDestination(link: CoverLink) -> some View {
        EmptyView()
    }

    @ViewBuilder private func sheetContent(item: CoverLink) -> some View {
        EmptyView()
    }
}
