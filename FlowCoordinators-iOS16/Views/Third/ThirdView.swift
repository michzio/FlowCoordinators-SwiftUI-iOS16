import SwiftUI

struct ThirdView: View {

    @StateObject var viewModel: ThirdViewModel

    var body: some View {
        ThirdFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            VStack {
                Text(viewModel.text)

                Button("Pop to root view") {
                    viewModel.popToRootAction()
                }
            }
        }
    }
}
