import SwiftUI

struct SecondView: View {

    @StateObject var viewModel: SecondViewModel

    var body: some View {
        SecondFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Text(viewModel.text)

                Button("Next screen button") {
                    viewModel.nextLink()
                }

                NavigationLink("Next screen link", value: SecondLink.link)
            }
        }
    }
}
