import Foundation

struct Cards: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name: String
    let manaCost: String?
    let type: String
    let rarity: String
    let setName: String
    let text: String
    let artist: String
}
