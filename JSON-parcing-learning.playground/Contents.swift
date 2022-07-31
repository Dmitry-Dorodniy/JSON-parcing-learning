import Foundation

let network = NetworkManager()

let masterServerURL = "https://api.magicthegathering.io"
let urlPath = "/v1/cards"

// MARK: - Get Cards
var queryItem = [URLQueryItem(name: "name", value: "Black Lotus|Opt")]
let cardsUrl = makeRequestUrl(masterUrl: masterServerURL,
                              path: urlPath,
                              queryItems: queryItem)

network.getDataFrom(urlRequest: cardsUrl) { result in
    switch result {
    case .success(let cards):
        Cards.printInfoAbout(cards)
    case .failure(let error):
        print("Error: \(error.localizedDescription )")
        break
    }
}
