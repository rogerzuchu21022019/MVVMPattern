//
//  ViewController.swift
//  MVVMPattern
//
//  Created by gcs on 6/8/22.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Flow
    //MARK: 1 Embeded sampleViewModel to View
    let viewModel : SampleViewModel = SampleViewModel()
    
    @IBAction func tap(_ sender: UIButton) {
    }
    @IBOutlet weak var `switch`: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: 2 ViewController see isOn property of sampleViewModel to update UI -> It's databinding from sampleViewModel
        //MARK: 3 go to the SampleViewModel
        viewModel.isOn.observeOn(.main).observeNext {
            (value:Bool) in
            self.switch.setOn(value, animated: true)
        }.dispose(in: bag)
    }


}

