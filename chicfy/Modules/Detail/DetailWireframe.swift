//
//  DetailWireframe.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation
import UIKit

final class DetailWireframe: DetailWireframeBehaviorProtocol {
    static func setupModule(detailModel: MasterCellModel) -> UIViewController? {
        guard let view = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return nil }
        
        var presenter: DetailPresenterBehaviorProtocol & DetailViewProtocol & DetailInteractorProtocol = DetailPresenter()
        var interactor: DetailInteractorBehaviorProtocol = DetailInteractor()
        let wireFrame: DetailWireframeBehaviorProtocol = DetailWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        presenter.detailModel = detailModel
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}

