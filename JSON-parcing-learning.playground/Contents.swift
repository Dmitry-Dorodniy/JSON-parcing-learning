import UIKit

let network = NetworkManager()
//let magicCard = "https://api.magicthegathering.io/v1/cards?name=Lotus"
//getData(urlRequest: magicCard)

let masterServerURL = "https://api.magicthegathering.io"
let urlPath = "/v1/cards"
var urlCardName = URLQueryItem(name: "name", value: "Opt")


let magicUrl = makeRequestUrl(masterUrl: masterServerURL,
                              path: urlPath,
                              queryItems: [urlCardName])

network.getDataFrom(urlRequest: magicUrl)
