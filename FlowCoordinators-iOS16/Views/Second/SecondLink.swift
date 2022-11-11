import Foundation

enum SecondLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
