import Foundation

public class NetworkManager {

    public init() {}

    private let sessionConfiguration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 20
        return configuration
    }()

//    var cards = [Card]()
    
    public func getDataFrom(urlRequest: URL?) {

        let session = URLSession(configuration: sessionConfiguration)
        //    let urlRequest = URL(string: urlRequest)
        guard let url = urlRequest else { return }

        session.dataTask(with: url) { data, responce, error in
            if error != nil {
                print("Error: \(error?.localizedDescription ?? "")")
            } else if let responce = responce as? HTTPURLResponse, responce.statusCode == 200 {
                print("Response status from server: \(responce.statusCode)\n")
                guard let data = data else { return }

                self.jsonDecoder(data: data)

//                let dataAsString = String(data: data, encoding: .utf8)
//              print("Get data: \n\(dataAsString ?? "nothing")\n")

            } else if let responce = responce as? HTTPURLResponse {
                print("Error status from server: \(responce.statusCode)\n")
                return
            }
        }.resume()
    }

    func jsonDecoder(data: Data) {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Cards.self, from: data)
//            cards = decoded.cards
            printInfoAbout(decoded.cards)

        } catch {
            print("Failed to decode JSON")
        }
    }

    func printInfoAbout(_ cards: [Card]) {

    cards.map {  card in
        print("""
    ****************************************************

    Название карты: \(card.name)
    Мана: \(card.manaCost  ?? "Не требует маны")
    Тип карты: \(card.type)
    Редкость: \(card.rarity)
    Название сета: \(card.setName)
    Художник: \(card.artist)

    """)
      }
    }
}
