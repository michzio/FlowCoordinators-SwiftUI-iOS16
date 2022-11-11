import SwiftUI

struct ContentView: View {

    @StateObject var viewModel: ContentViewModel

    var body: some View {
        ContentFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                Text(viewModel.text)

                Text("Buttons")

                Group {
                    Button("First view >", action: viewModel.firstAction)
                    Button("Second view >", action: viewModel.secondAction)
                    Button("Third view >", action: viewModel.thirdAction)
                    Button("Custom view >", action: viewModel.customAction)

                    Button("Select link (old) >", action: viewModel.selectLinkAction)

                    Text("Presentation")
                    Button("Sheet view", action: viewModel.sheetAction)
                    Button("Cover view", action: viewModel.coverAction)
                }


                Text("Links")

                NavigationLink(value: ContentLink.firstLink(text: "Link param")) {
                    Text("First link >")
                }
                NavigationLink(value: ContentLink.secondLink(number: 200)) {
                    Text("Second link >")
                }

                NavigationLink(value: ContentLink.thirdLink) {
                    Text("Third link >")
                }

                NavigationLink(value: "Custom link") {
                    Text("Custom link >")
                }
            }
        }
        .navigationBarTitle("Title", displayMode: .inline)
    }
}
