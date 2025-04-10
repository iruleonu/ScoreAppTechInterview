//
import RxSwift

class ScoreViewModel {        
    private let disposeBag = DisposeBag()
    
    // Private subjects
    private let scoreSubject = PublishSubject<String>()
    private let errorSubject = PublishSubject<String>()
    
    // Public observables
    var scoreObservable: Observable<String> // Complete it here ...
    
    var errorObservable: Observable<String> // Complete it here ...
    
    func loadScore() {
        ScoreService().fetchScore()// Complete it here ...
   }
}

