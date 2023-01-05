//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!

    var coinManager = CoinManager()
    var coinModel: CoinModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }

    func updateUI() {
        DispatchQueue.main.sync {
            guard let coinModel = coinModel else { return }
            bitcoinLabel.text = String(format: "%.3f", coinModel.rate)
            currencyLabel.text = coinModel.quote
        }
    }
}

//MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

//MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    func didUpdateCoinSelection(_ model: CoinManager, coinModel: CoinModel) {
        self.coinModel = coinModel
        updateUI()
    }

    func didFailWithError(_ coinManager: CoinManager, error: Error) {
        print(error)
    }
}
