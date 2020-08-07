//
//  SplashViewController.swift
//  ImageShow
//
//  Created by 손창빈 on 2020/07/13.
//  Copyright © 2020 cpson. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initLayout()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func initLayout() {
        showLabelAnimation()
    }
    
    private func showLabelAnimation() {
        UIView.animate(withDuration: 1.0, animations: {
            self.titleLabel.alpha = 1
        }) { finished in
            self.hideLabelAnimation()
        }
    }
    
    private func hideLabelAnimation() {
        UIView.animate(withDuration: 1.0, animations: {
            self.titleLabel.alpha = 0
        }) { finished in
            self.changeRootViewToMain()
        }
    }
    
    private func changeRootViewToMain() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
            fatalError("Could not instantiate MainViewController!")
        }
        
        if #available(iOS 13, *) {
            guard let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate else { return }
            sceneDelegate.window?.switchRootView(vc)
        } else {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            appDelegate.window?.switchRootView(vc)
        }
    }
}
