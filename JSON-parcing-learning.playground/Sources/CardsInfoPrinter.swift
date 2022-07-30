import Foundation

public class Printer {
func printInfoAbout(_ cards: Cards) {
    _ = cards.cards.map {  card in
        print("""
    ****************************************************

    Название карты: \(card.name)
    Мана: \(card.manaCost  ?? "Не требует маны")
    Тип карты: \(card.typeOfCard)
    Редкость: \(card.rarity)
    Название сета: \(card.setName)
    Художник: \(card.artist)

    """)
    }
    print("Количество полученных карт: \(cards.cards.count)")
    }
}
