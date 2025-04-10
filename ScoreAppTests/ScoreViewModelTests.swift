//
import XCTest
import RxSwift
import RxTest
@testable import ScoreApp

class ScoreViewModelTests: XCTestCase {
    var viewModel: ScoreViewModel!

    override func setUp() {
        super.setUp()
    }
    
    func test_WhenServiceReturnsPositiveScore_ThenViewModelEmitsFormattedScoreAndEmptyErro() { }
    
    func test_WhenServiceReturnsError_ThenViewModelEmitsErrorAndEmptyScore() { }
}
