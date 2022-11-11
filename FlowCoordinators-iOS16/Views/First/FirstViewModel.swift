import SwiftUI

final class FirstViewModel: FirstFlowState {

    @Published var text: String

    init(path: Binding<NavigationPath>, text: String?) {
        if let text = text {
            self.text = "First View with text: \(text)"
        } else {
            self.text = "Default First View"
        }

        super.init(path: path)
    }
}
