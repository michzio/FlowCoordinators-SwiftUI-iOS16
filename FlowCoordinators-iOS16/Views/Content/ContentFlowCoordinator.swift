import SwiftUI

open class ContentFlowState: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedItem: ContentLink?
    @Published var coverItem: ContentLink?
    @Published var selectedLink: ContentLink? // old style
}

struct ContentFlowCoordinator<Content: View>: View {

    @ObservedObject var state: ContentFlowState
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
                    .sheet(item: $state.presentedItem, content: sheetContent)
                    .fullScreenCover(item: $state.coverItem, content: coverContent)

                navigationLinks
            }
            .navigationDestination(for: ContentLink.self, destination: linkDestination)
            .navigationDestination(for: String.self, destination: customDestination)
        }
    }

    private var navigationLinks: some View {
        /// to make this link work you need to replace NavigationStack with NavigationView!
        NavigationLink(destination: linkDestination, item: $state.selectedLink) { EmptyView() }
    }

    @ViewBuilder private func linkDestination(link: ContentLink) -> some View {
        switch link {
        case let .firstLink(text):
            firstDestination(text)
        case let .secondLink(number):
            secondDestination(number)
        case .thirdLink:
            thirdDestination()
        default:
            EmptyView()
        }
    }

    @ViewBuilder private func sheetContent(item: ContentLink) -> some View {
        switch item {
        case let .sheetLink(text):
            SheetView(viewModel: SheetViewModel(text: text))
        default:
            EmptyView()
        }
    }

    @ViewBuilder private func coverContent(item: ContentLink) -> some View {
        switch item {
        case let .coverLink(text):
            CoverView(viewModel: CoverViewModel(text: text))
        default:
            EmptyView()
        }
    }

    private func customDestination(text: String) -> some View {
        Text(text)
    }

    private func firstDestination(_ text: String?) -> some View {
        let viewModel = FirstViewModel(path: $state.path, text: text)
        let view = FirstView(viewModel: viewModel)
        return view
    }

    private func secondDestination(_ number: Int?) -> some View {
        let viewModel = SecondViewModel(path: $state.path, number: number)
        let view = SecondView(viewModel: viewModel)
        return view
    }

    private func thirdDestination() -> some View {
        let viewModel = ThirdViewModel(path: $state.path)
        let view = ThirdView(viewModel: viewModel)
        return view
    }
}
