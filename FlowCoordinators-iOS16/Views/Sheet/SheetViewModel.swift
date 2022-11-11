import Foundation

final class SheetViewModel: SheetFlowState {

    let text: String

    init(text: String) {
        self.text = "Sheet view with \(text)"
    }
}
