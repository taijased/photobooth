//
//  HomeViewController.swift
//  photobooth
//
//  Created by Максим Спиридонов on 18.08.2020.
//  Copyright © 2020 Максим Спиридонов. All rights reserved.
//


import UIKit


final class HomeViewController: UIViewController, StoryboardInitializable {
    
    fileprivate let opacityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    fileprivate var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeViewModel()
        setupUI()
    }
    
    fileprivate func setupUI() {
        self.view.backgroundColor = .random()
        
        
        
        
        
        
        guard let viewModel = viewModel else { return }
        viewModel.delegate = self
        view.addSubview(viewModel.bottomControls)
        viewModel.bottomControls.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewModel.bottomControls.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewModel.bottomControls.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewModel.bottomControls.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        
        
        view.addSubview(opacityView)
        opacityView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        opacityView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        opacityView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        opacityView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    fileprivate func navigation(_ type: HomeNavigation) {
        switch type {
        case .choose:
            let viewController = ChooseViewController()
            viewController.delegate = self
            self.present(viewController, animated: true, completion: nil)
        case .dismiss:
            self.dismiss(animated: true, completion: nil)
        case .photo:
            let viewController = PhotoViewController()
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .crossDissolve
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    
    
    // MARK: settings Navigation bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}



//MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func navigationTo(to: HomeNavigation) {
        self.navigation(to)
    }
}



//MARK: - ChooseViewControllerDelegate
extension HomeViewController: ChooseViewControllerDelegate {
    func deinitController() {
        print(#function)
    }
    
    func didSelectItemAt(_ item: MaskModel) {
        print(item)
    }
    

}

