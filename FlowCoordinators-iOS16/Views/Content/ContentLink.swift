import Foundation

enum ContentLink: Hashable, Identifiable {
    case firstLink(text: String?)
    case secondLink(number: Int?)
    case thirdLink
    case sheetLink(item: String)
    case coverLink(item: String)

    var id: String {
        String(describing: self)
    }
}
