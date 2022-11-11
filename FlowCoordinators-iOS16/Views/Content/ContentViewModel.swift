import Foundation

final class ContentViewModel: ContentFlowState {

    let text: String = "Content View"

    func firstAction() {
        path.append(ContentLink.firstLink(text: "Some param"))
    }

    func secondAction() {
        path.append(ContentLink.secondLink(number: 2))
    }

    func thirdAction() {
        path.append(ContentLink.thirdLink)
    }

    func customAction() {
        path.append("Custom action")
    }

    func sheetAction() {
        presentedItem = .sheetLink(item: "Sheet param")
    }

    func selectLinkAction() {
        selectedLink = .firstLink(text: "Selected link action")
    }

    func coverAction() {
        coverItem = .coverLink(item: "Cover param")
    }
}
