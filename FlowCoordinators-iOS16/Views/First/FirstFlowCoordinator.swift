import SwiftUI

open class FirstFlowState: ObservableObject {

    @Published var presentedItem: FirstLink?

    @Binding var path: NavigationPath

    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

struct FirstFlowCoordinator<Content: View>: View {

    @ObservedObject var state: FirstFlowState
    let content: () -> Content

    var body: some View {
        content()
            .sheet(item: $state.presentedItem, content: sheetContent)
            .navigationDestination(for: FirstLink.self, destination: linkDestination)
    }

    @ViewBuilder private func linkDestination(link: FirstLink) -> some View {
        EmptyView()
    }

    @ViewBuilder private func sheetContent(item: FirstLink) -> some View {
        EmptyView()
    }
}
