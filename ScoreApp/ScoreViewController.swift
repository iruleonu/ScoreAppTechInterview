//
import UIKit
import RxSwift
import RxCocoa

class ScoreViewController: UIViewController {
    private let viewModel: ScoreViewModel
    private let disposeBag = DisposeBag()
    
    private let scoreLabel: UILabel = {
         let label = UILabel()
         label.textAlignment = .center
         label.font = .systemFont(ofSize: 24, weight: .bold)
         return label
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .red
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
   }()
    
    init(viewModel: ScoreViewModel = ScoreViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = ScoreViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.loadScore()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
  
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(errorLabel)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
        
    private func bindViewModel() {
        viewModel.scoreObservable
            .bind(to: scoreLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.errorObservable
            .bind(to: errorLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

