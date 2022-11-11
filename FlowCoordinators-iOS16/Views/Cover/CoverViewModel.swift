import Foundation

final class CoverViewModel: CoverFlowState {

    let text: String

    init(text: String) {
        self.text = "Cover view with \(text)"
    }
}
