import Foundation

enum FirstLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
