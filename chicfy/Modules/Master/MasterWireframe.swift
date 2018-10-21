//
//  MasterWireframe.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation
import UIKit

final class MasterWireframe {
    static func setupModule() -> UIViewController? {
        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationController")
        guard let view = navigationController.childViewControllers.first as? MasterViewController else { return nil }
        
        var presenter: MasterPresenterBehaviorProtocol & MasterViewProtocol & MasterInteractorProtocol = MasterPresenter()
        var interactor: MasterInteractorBehaviorProtocol = MasterInteractor()
        let wireFrame: MasterWireframeBehaviorProtocol = MasterWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        interactor.presenter = presenter
        
        return navigationController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}

extension MasterWireframe: MasterWireframeBehaviorProtocol {
    func navigateToDetailModule(from view: MasterViewBehaviorProtocol, model: MasterCellModel) {
        guard let detailViewController = DetailWireframe.setupModule(detailModel: model) else { return }
        
        if let sourceViewController = view as? UIViewController {
            sourceViewController.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
