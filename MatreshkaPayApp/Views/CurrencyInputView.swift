//
//  CurrencyInputView.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import UIKit

protocol CurrencyViewDelegate: AnyObject {
    func didSelectCurrency()
}

class CurrencyInputView: UIView, Themed {
    
    // MARK: - Themed Protocol Properties
    
    var theme: ThemeProvider = AppTheme.shared
    
    // MARK: - Properties
    
    var arrowTappedHandler: (() -> Void)?
    var numberValueChangedHandler: ((Double, String) -> Void)?
    var textFieldAccessibilityIdentifier: String? {
        didSet {
            textField.accessibilityIdentifier = textFieldAccessibilityIdentifier
        }
    }
    var currencyStackViewAccessibilityIdentifier: String? {
        didSet {
            stackView.accessibilityIdentifier = currencyStackViewAccessibilityIdentifier
        }
    }
    
    private var currencyInputDelegate = CurrencyInputDelegate()
    private var currencyCode: String!
    private let currencySymbolGenerator = CurrencySymbolGenerator()
    
    // MARK: - UI Properties
    
    @UsingAutoLayout private var textField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.placeholder = "0.00"
        return textField
    }()
    
    @UsingAutoLayout private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    @UsingAutoLayout private var currencySymbolLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    @UsingAutoLayout private var currencyCodeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    @UsingAutoLayout private var arrowDownImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
        setupConstraints()
        applyBorder()
        setupGestureRecognizer()
        applyTheme()
        currencyInputDelegate.onValueChanged = { [weak self] value in
            guard let self else {
                return
            }
            let doubleValue = Double(value) ?? 0.0
            self.numberValueChangedHandler?(doubleValue, self.currencyCode)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        addSubview(textField)
        addSubview(stackView)
        
        textField.delegate = currencyInputDelegate
        
        stackView.addArrangedSubview(currencySymbolLabel)
        stackView.addArrangedSubview(currencyCodeLabel)
        stackView.addArrangedSubview(arrowDownImageView)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -2),

            stackView.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalTo: textField.heightAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func applyBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 8
    }
    
    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        stackView.isUserInteractionEnabled = true
        stackView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - User Interaction
    
    @objc private func handleTapGesture() {
        arrowTappedHandler?()
    }
    
    // MARK: - Public Methods
    
    func setupCurrency(code: String) {
        currencyCode = code
        currencyCodeLabel.text = code
        let currencySymbol = currencySymbolGenerator.getCurrencySymbol(for: code)
        
        currencySymbolLabel.text = currencySymbol.symbol
    }
    
    func setupTextfieldValue(value: String) {
        textField.text = value
    }
    
    // MARK: - Themed Protocol Methods
    
    func applyTheme() {
        textField.font = theme.inputFont
        currencyCodeLabel.font = theme.switcherFont
    }
}


