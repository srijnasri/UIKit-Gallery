//
//  ViewController.swift
//  JournalMe
//
//  Created by Srijnasri Negi on 16/05/23.
//

import UIKit

class GenericViewController: UIViewController {
    var selectedComponent: Components?
    
    init(selectedComponent: Components? = nil) {
        self.selectedComponent = selectedComponent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var container: UIView = {
        let myView = UIView()
        myView.backgroundColor = .gray
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("click me", for: .normal)
        button.addTarget(nil, action: #selector(buttonPressed), for: .allTouchEvents)
        button.backgroundColor = .blue
//        button.isPointerInteractionEnabled = true
//        button.isHighlighted = true
//        if button.isHovered {
//            button.backgroundColor = .green
//        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var textView: UITextField = {
        let textView = UITextField()
        textView.keyboardType = .asciiCapableNumberPad
        textView.placeholder = "write here"
        textView.borderStyle = .roundedRect
        textView.textAlignment = .justified
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.date = .now
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .systemPink
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 20
        stepper.stepValue = 2
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        return stepper
    }()
    
    private lazy var switchBtn: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.onTintColor = .systemPink
        switchBtn.isOn = false
        switchBtn.preferredStyle = .sliding
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        return switchBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.rightBarButtonItem = .init(systemItem: .add)
        view.backgroundColor = .white
        switch selectedComponent {
        case .UIButton:
            title = selectedComponent?.rawValue
            setUpViews()
        case .UIdatePicker:
            title = selectedComponent?.rawValue
            showDatePicker()
        case .UIStepper:
            title = selectedComponent?.rawValue
            showStepper()
        case .UISlider:
            title = selectedComponent?.rawValue
            showSlider()
        case .UISwitch:
            title = selectedComponent?.rawValue
            showSwitch()
        case .UITextField:
            title = selectedComponent?.rawValue
            showTextField()
        case nil:
            print("Nothing selected")
        }
        
    }

    private func setUpViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        container.addSubview(label)
        container.addSubview(button)
        let hCon = container.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        hCon.isActive = true
        hCon.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
    
    @objc func buttonPressed() {
        label.text = "You pressed the button."
    }
    
    @objc func sliderValueChanged() {
        label.text = "\(Int(slider.value))"
    }
    
    @objc func stepperValueChanged() {
        label.text = "\(Int(stepper.value))"
    }
    
    func showTextField() {
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func showDatePicker() {
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        ])
    }
    
    func showSlider() {
        label.text = "\(Int(slider.value))"
        view.addSubview(label)
        view.addSubview(slider)
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: slider.leadingAnchor)
        ])
    }
    
    func showStepper() {
        label.text = "\(Int(stepper.value))"
        view.addSubview(label)
        view.addSubview(stepper)
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stepper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stepper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: stepper.leadingAnchor)
        ])
    }
    
    func showSwitch() {
        view.addSubview(switchBtn)
        NSLayoutConstraint.activate([
            switchBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            switchBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        ])
    }
}

