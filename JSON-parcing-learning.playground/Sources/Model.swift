import Foundation

struct Cards: Codable {
    let cards: [Card]

    static func printInfoAbout(_ cards: Cards) {

        var printingCount = 0

        _ = cards.cards.map {  card in
            guard card.name == "Opt" || card.name == "Black Lotus" else { return }
            print("""
    ****************************************************

    Название карты: \(card.name)
    Мана: \(card.manaCost  ?? "Не требует маны")
    Тип карты: \(card.typeOfCard)
    Редкость: \(card.rarity)
    Название сета: \(card.setName)
    Художник: \(card.artist)

    """)
            printingCount += 1
        }
        print("""
    Количество полученных карт: \(cards.cards.count)
    Количество отфильтрованных карт \(printingCount)

    """)
    }
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
