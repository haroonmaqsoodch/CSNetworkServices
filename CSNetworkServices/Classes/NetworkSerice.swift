
import Foundation

public class NetworkSerice {
   public static let shared = NetworkSerice()
    
  public static  func serviceCall(url: String, completion: @escaping (Result<Any?, Error>) -> ()){
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(String(describing: error))
            }else if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}
