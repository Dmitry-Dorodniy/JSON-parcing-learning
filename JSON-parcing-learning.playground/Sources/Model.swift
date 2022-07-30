import Foundation

struct Cards: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name: String
    let manaCost: String?
    let typeOfCard: String
    let rarity: String
    let setName: String
    let text: String
    let artist: String

    enum CodingKeys: String, CodingKey {
        case name
        case manaCost
        case typeOfCard = "type"
        case rarity
        case setName
        case text
        case artist


    }
}
