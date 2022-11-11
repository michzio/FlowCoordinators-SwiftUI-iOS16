import Foundation

enum ThirdLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
