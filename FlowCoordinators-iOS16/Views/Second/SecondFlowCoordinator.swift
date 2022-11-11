import SwiftUI

open class SecondFlowState: ObservableObject {
    @Published var presentedItem: SecondLink?

    @Binding var path: NavigationPath

    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

struct SecondFlowCoordinator<Content: View>: View {

    @ObservedObject var state: SecondFlowState
    let content: () -> Content

    var body: some View {
        content()
            .sheet(item: $state.presentedItem, content: sheetContent)
            .navigationDestination(for: SecondLink.self, destination: linkDestination)
    }

    @ViewBuilder private func linkDestination(link: SecondLink) -> some View {
        switch link {
        case .link:
            thirdView()
        }
    }

    @ViewBuilder private func sheetContent(item: SecondLink) -> some View {
        EmptyView()
    }

    private func thirdView() -> some View {
        let viewModel = ThirdViewModel(path: $state.path)
        return ThirdView(viewModel: viewModel)
    }
}
