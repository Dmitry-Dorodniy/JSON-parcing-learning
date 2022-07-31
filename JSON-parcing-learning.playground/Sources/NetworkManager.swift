import Foundation

public class NetworkManager {

    public init() {}

    private let decoder = JSONDecoder()

    private let sessionConfiguration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 20
        return configuration
    }()

    public func getDataFrom(urlRequest: URL?, complition: @escaping (Result<Cards,Error>) -> Void) {

        let session = URLSession(configuration: sessionConfiguration)
        guard let url = urlRequest else { return }

        session.dataTask(with: url) { [weak self] data, responce, error in
            
            guard let strongSelf = self else { return }

            if error != nil {
                complition(.failure(error!))

            } else if let responce = responce as? HTTPURLResponse, responce.statusCode == 200 {
                print("Success server status: \(HTTPURLResponse.localizedString(forStatusCode: responce.statusCode))\n")
                guard let data = data else { return }

                do {
                    let decoded = try strongSelf.decoder.decode(Cards.self, from: data)
                    DispatchQueue.main.async {
                        complition(.success(decoded))
                    }
                } catch {
                    print("Failed to decode JSON")
                }

            } else if let responce = responce as? HTTPURLResponse {
                print("Error status from server: \(HTTPURLResponse.localizedString(forStatusCode: responce.statusCode))\n")
                return
            }
        }.resume()
    }
}


