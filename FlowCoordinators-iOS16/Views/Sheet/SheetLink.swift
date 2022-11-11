import Foundation

enum SheetLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
