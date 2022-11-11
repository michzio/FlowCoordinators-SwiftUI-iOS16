import SwiftUI

open class SheetFlowState: ObservableObject {
    @Published var sheetPath = NavigationPath()
    @Published var presentedItem: SheetLink?
}

struct SheetFlowCoordinator<Content: View>: View {

    @ObservedObject var state: SheetFlowState
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.sheetPath) {
            content()
                .sheet(item: $state.presentedItem, content: sheetContent)
                .navigationDestination(for: SheetLink.self, destination: linkDestination)
        }
    }

    @ViewBuilder private func linkDestination(link: SheetLink) -> some View {
        EmptyView()
    }

    @ViewBuilder private func sheetContent(item: SheetLink) -> some View {
        EmptyView()
    }
}
