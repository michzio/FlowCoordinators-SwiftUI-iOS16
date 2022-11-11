import Foundation

enum CoverLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
