import SwiftUI

struct FirstView: View {

    @StateObject var viewModel: FirstViewModel

    var body: some View {
        FirstFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.red.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}
