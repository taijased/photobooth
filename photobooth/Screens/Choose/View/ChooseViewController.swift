//
//  ChooseViewController.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//


import UIKit


protocol ChooseViewControllerDelegate: class {
    func deinitController()
    func didSelectItemAt(_ item: MaskModel)
}


class ChooseViewController: UIViewController, StoryboardInitializable {
    
    weak var delegate: ChooseViewControllerDelegate?
    var viewModel: ChooseViewModelType?
    
    fileprivate let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 1.5
        view.layer.backgroundColor = UIColor(red: 0.529, green: 0.529, blue: 0.529, alpha: 1).cgColor
        return view
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        transitioningDelegate = self
        modalPresentationStyle = .custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ChooseViewModel()
        setupUI()
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        
        guard let viewModel = viewModel else { return }
        view.addSubview(viewModel.collectionView)
        viewModel.collectionView.fillSuperview()
        viewModel.collectionView.collectionDelegate = self
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissController))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        view.addSubview(lineView)
        lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 6).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 31).isActive = true
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.deinitController()
    }
    
    @objc private func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
}




//MARK: - UIViewControllerTransitioningDelegate

extension ChooseViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentController = PresentationViewController(presentedViewController: presented, presenting: presenting)
        presentController.closeDelegate = self
        return presentController
    }
}


//MARK: - PresentationViewControllerDelegate
extension ChooseViewController: PresentationViewControllerDelegate {
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
}




//MARK: - ChooseCollectionViewDelegate
extension ChooseViewController: ChooseCollectionViewDelegate {
    func didSelectItemAt() {
        guard let item = viewModel?.collectionView.viewModel?.viewModelForSelectedRow() else { return }
        delegate?.didSelectItemAt(item)
        self.dismiss(animated: true, completion: nil)
    }
}

