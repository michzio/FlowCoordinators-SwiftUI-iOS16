import SwiftUI

final class ThirdViewModel: ThridFlowState {

    let text = "Default Third View"

    func popToRootAction() {
        path = .init()
    }
}
