import Foundation

let network = NetworkManager()

let masterServerURL = "https://api.magicthegathering.io"
let urlPath = "/v1/cards"

// MARK: - Get Lotus Card
var urlCardName = URLQueryItem(name: "name", value: "Black Lotus")
let blackLotusUrl = makeRequestUrl(masterUrl: masterServerURL,
                              path: urlPath,
                              queryItems: [urlCardName])

network.getDataFrom(urlRequest: blackLotusUrl)

// MARK: - Get Opt Card
urlCardName = URLQueryItem(name: "name", value: "Opt".inDoubleQuote())
let optUrl = makeRequestUrl(masterUrl: masterServerURL,
                                   path: urlPath,
                                   queryItems: [urlCardName])

network.getDataFrom(urlRequest: optUrl)
