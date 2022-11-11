import SwiftUI

open class ThridFlowState: ObservableObject {

    @Published var presentedItem: ThirdLink?

    @Binding var path: NavigationPath

    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

struct ThirdFlowCoordinator<Content: View>: View {

    @ObservedObject var state: ThridFlowState
    let content: () -> Content

    var body: some View {
        content()
            .sheet(item: $state.presentedItem, content: sheetContent)
            .navigationDestination(for: ThirdLink.self, destination: linkDestination)
    }

    @ViewBuilder private func linkDestination(link: ThirdLink) -> some View {
        EmptyView()
    }

    @ViewBuilder private func sheetContent(item: ThirdLink) -> some View {
        EmptyView()
    }
}
