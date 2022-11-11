import SwiftUI

struct CoverView: View {

    @Environment(\.dismiss) private var dismiss

    @StateObject var viewModel: CoverViewModel

    var body: some View {
        CoverFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                Text(viewModel.text)
                
                Button("Close", action: { dismiss() })
            }
        }
    }
}
