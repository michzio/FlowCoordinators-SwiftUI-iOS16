import SwiftUI

final class SecondViewModel: SecondFlowState  {

    @Published var text: String

    init(path: Binding<NavigationPath>, number: Int?) {
        if let number = number {
            self.text = "Second View with number: \(number)"
        } else {
            self.text = "Default Second View"
        }

        super.init(path: path)
    }

    func nextLink() {
        path.append(SecondLink.link)
    }
}
