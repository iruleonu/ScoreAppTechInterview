//
import Foundation
import RxSwift

enum ScoreServiceError: Error {
    case negativeForbidden    
}

class ScoreService {
    func fetchScore() -> Observable<Int> {
        // Generate random number between -100 and 100
        // Assume that this is a remote api call
        let randomScore = Int.random(in: -100...100)
        
        return Observable.create { observer in
            DispatchQueue.global(qos: .background).async {
                if randomScore < 0 {
                    observer.onError(ScoreServiceError.negativeForbidden)
                } else {
                    observer.onNext(randomScore)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
