//
//  ExpenseRegisterViewController.swift
//  BudgetPlanner
//
//  Created by Valpio  on 05.12.2023.
//

import UIKit
import SnapKit

class ExpenseRegisterViewController: UIViewController {

    private let number0Button = UIButton()
    private let number1Button = UIButton()
    private let number2Button = UIButton()
    private let number3Button = UIButton()
    private let number4Button = UIButton()
    private let number5Button = UIButton()
    private let number6Button = UIButton()
    private let number7Button = UIButton()
    private let number8Button = UIButton()
    private let number9Button = UIButton()
    private let commaButton = UIButton()
    private let doneButton = UIButton()
    private let clearButton = UIButton()
    
    private let registerExpenseFieldView = UIView()
    private let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .backgroundColor
        makeUI()
    }
    
    func makeUI() {
        setupButtons()
        makeKeyboardConstraints()
        makeTextFieldConstraints()
    }
    
    func setupButtons() {
        [
            number0Button,
            number1Button,
            number2Button,
            number3Button,
            number4Button,
            number5Button,
            number6Button,
            number7Button,
            number8Button,
            number9Button
        ].enumerated().forEach { index, button in
            button.backgroundColor = .darkGrayButtonColor
            button.tag = index
            button.setTitle("\(index)", for: .normal)
            button.setTitleColor(.defaultTextColor, for: .normal)
            button.addTarget(self, action: #selector(tapNumberButton), for: .touchUpInside)
        }
        
        commaButton.backgroundColor = .darkGrayButtonColor
        commaButton.setTitle(",", for: .normal)
        commaButton.setTitleColor(UIColor.defaultTextColor, for: .normal)
        
        doneButton.backgroundColor = .darkGreenButtonColor
        doneButton.setTitle("OK", for: .normal)
        doneButton.setTitleColor(UIColor.defaultTextColor, for: .normal)
        
        clearButton.backgroundColor = .lightGreenButtonColor
        clearButton.setTitle("X", for: .normal)
        clearButton.setTitleColor(UIColor.defaultTextColor, for: .normal)
    }
    
    func makeTextFieldConstraints() {
        registerExpenseFieldView.backgroundColor = .yellow
        view.addSubview(registerExpenseFieldView)
        registerExpenseFieldView.addSubview(textField)
        
        registerExpenseFieldView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeKeyboardConstraints() {
        
        let spacingBetweenButtons: CGFloat = 10
        
        let topNumberHorizontalStackView = UIStackView(arrangedSubviews: [number7Button,
                                                                          number8Button,
                                                                          number9Button])
        let centerNumberHorizontalStackView = UIStackView(arrangedSubviews: [number4Button,
                                                                             number5Button,
                                                                             number6Button])
        let bottomNumberHorizontalStackView = UIStackView(arrangedSubviews: [number1Button,
                                                                             number2Button,
                                                                             number3Button])
        let zeroWithCommaHorizontalStackView = UIStackView(arrangedSubviews: [number0Button,
                                                                              commaButton])
        let clearAndDoneVerticalStackView = UIStackView(arrangedSubviews: [clearButton,
                                                                           doneButton])
        let numbersVerticalStackView = UIStackView(arrangedSubviews: [topNumberHorizontalStackView,
                                                                      centerNumberHorizontalStackView,
                                                                      bottomNumberHorizontalStackView,
                                                                      zeroWithCommaHorizontalStackView])
        let numbersWithControlButtonsHorizontalStackView = UIStackView(arrangedSubviews: [numbersVerticalStackView, clearAndDoneVerticalStackView])
        
        [topNumberHorizontalStackView, centerNumberHorizontalStackView, bottomNumberHorizontalStackView].forEach { stack in
            stack.spacing = spacingBetweenButtons
            stack.axis = .horizontal
            stack.distribution = .fillEqually
        }
        
        [clearAndDoneVerticalStackView, numbersVerticalStackView].forEach { stack in
            stack.spacing = spacingBetweenButtons
            stack.axis = .vertical
        }
        
        numbersVerticalStackView.distribution = .fillEqually
        clearAndDoneVerticalStackView.distribution = .fill
        
        zeroWithCommaHorizontalStackView.axis = .horizontal
        zeroWithCommaHorizontalStackView.spacing = spacingBetweenButtons
        
        numbersWithControlButtonsHorizontalStackView.spacing = spacingBetweenButtons
        numbersWithControlButtonsHorizontalStackView.distribution = .fill
        numbersWithControlButtonsHorizontalStackView.axis = .horizontal
        
        view.addSubview(numbersWithControlButtonsHorizontalStackView)
        
        numbersWithControlButtonsHorizontalStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(view.frame.height / 3)
        }
        
        clearAndDoneVerticalStackView.snp.makeConstraints { make in
            make.width.equalTo(number1Button)
        }
        
        commaButton.snp.makeConstraints { make in
            make.width.equalTo(number1Button)
        }
        
        clearButton.snp.makeConstraints { make in
            make.height.equalTo(number1Button)
        }
    }
}

extension ExpenseRegisterViewController {
    @objc func tapNumberButton(sender: UIButton) {
        var text = textField.text ?? ""
        text += "\(sender.tag)"
        textField.text = text
    }
}
