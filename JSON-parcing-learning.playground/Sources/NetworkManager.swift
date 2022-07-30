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

    public func getDataFrom(urlRequest: URL?) {

        let session = URLSession(configuration: sessionConfiguration)
        //    let urlRequest = URL(string: urlRequest)
        guard let url = urlRequest else { return }

        session.dataTask(with: url) { [weak self] data, responce, error in

            guard let strongSelf = self else { return }

            if error != nil {
                print("Error: \(error?.localizedDescription ?? "")")
            } else if let responce = responce as? HTTPURLResponse, responce.statusCode == 200 {
                print("Success server status: \(HTTPURLResponse.localizedString(forStatusCode: responce.statusCode))\n")
                guard let data = data else { return }
                
                strongSelf.jsonDecoder(data: data)
            
            } else if let responce = responce as? HTTPURLResponse {
                print("Error status from server: \(HTTPURLResponse.localizedString(forStatusCode: responce.statusCode))\n")
                return
            }
        }.resume()
    }

    private func jsonDecoder(data: Data) {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Cards.self, from: data)

            DispatchQueue.main.async {
                Printer.printInfoAbout(decoded)
            }

        } catch {
            print("Failed to decode JSON")
        }
    }
}
