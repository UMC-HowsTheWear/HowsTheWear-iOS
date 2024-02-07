//
//  MyPostViewController.swift
//  HowsTheWear
//
//  Created by RAFA on 2/7/24.
//

import PhotosUI
import UIKit

final class MyPostViewController: UIViewController {
    
    private let myPostView = MyPostView()
    private let picker = UIImagePickerController()
    private var selectedImages = [UIImage]()
    private var isDropdownMenuOpen = false
    
    let feelsLikeOptions = ["적당해요", "추워요", "선선해요", "더워요", "따뜻해요"]
    
    private let shadowBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowRadius = 5
        $0.isUserInteractionEnabled = false
        $0.isHidden = true
    }
    
    lazy var dropdownTableView = UITableView().then {
        $0.isHidden = true
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
        $0.backgroundColor = .white
    }
    
    override func loadView() {
        view = myPostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarUI()
        configureUI()
        setupGesture()
    }
    
}

extension MyPostViewController:
    UIImagePickerControllerDelegate,
    PHPickerViewControllerDelegate,
    UINavigationControllerDelegate
{
    
    func openLibrary() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("카메라를 사용할 수 없습니다.")
            return
        }
        
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("이미지를 가져오는 데 실패했습니다.")
            return
        }
        
        selectedImages.append(selectedImage)
        updateScrollView()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        selectedImages.removeAll()
        
        let group = DispatchGroup()
        for result in results {
            group.enter()
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                defer { group.leave() }
                if let error = error {
                    print("Error loading image: \(error)")
                    return
                }
                if let image = image as? UIImage {
                    print("Image loaded successfully")
                    self?.selectedImages.append(image)
                } else {
                    print("Loaded object is not an image")
                }
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            print("Updating scroll view with images")
            self?.updateScrollView()
        }
    }
    
    func updateScrollView() {
        guard !selectedImages.isEmpty else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.myPostView.updateScrollView(with: self?.selectedImages ?? [])
            self?.myPostView.pageControl.numberOfPages = self?.selectedImages.count ?? 0
            self?.myPostView.pageControl.isHidden = (self?.selectedImages.count ?? 0) <= 1
        }
    }
    
}

extension MyPostViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        myPostView.pageControl.currentPage = Int(pageIndex)
    }
    
}

extension MyPostViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.444, green: 0.607, blue: 0.901, alpha: 1).cgColor
    }
    
    // 텍스트 필드가 포커싱을 잃을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // 키보드 내리면서 동작
        textField.resignFirstResponder()
        return true
    }
    
}

extension MyPostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feelsLikeOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = feelsLikeOptions[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        myPostView.feelsLikeLabel.text = feelsLikeOptions[indexPath.row]
        myPostView.feelsLikeLabel.textColor = UIColor.black
        closeDropdownMenu()
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = UIColor(red: 0.965, green: 0.976, blue: 0.996, alpha: 1)
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = .clear
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == myPostView.customTagTextField {
            myPostView.customTagButton.isEnabled = !(textField.text?.isEmpty ?? true)
        }
    }
    
}

extension MyPostViewController: CalendarViewControllerDelegate {
    
    func didSelectDate(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        myPostView.dateLabel.text = dateFormatter.string(from: date)
        myPostView.dateLabel.textColor = .black
    }
    
}

private extension MyPostViewController {
    
    func setupNavigationBarUI() {
        title = "오늘 나의 패션은"
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.2
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4)
        navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
    func configureUI() {
        view.addSubview(shadowBackgroundView)
        view.addSubview(dropdownTableView)
        
        shadowBackgroundView.snp.makeConstraints {
            $0.bottom.equalTo(myPostView.feelsLikeView.snp.top).inset(-10)
            $0.left.right.equalTo(myPostView.feelsLikeInfoView)
            $0.height.equalTo(200)
        }
        
        dropdownTableView.snp.makeConstraints {
            $0.bottom.equalTo(myPostView.feelsLikeView.snp.top).inset(-10)
            $0.left.right.equalTo(myPostView.feelsLikeInfoView)
            $0.height.equalTo(200)
        }
        
        dropdownTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        myPostView.customTagTextField.delegate = self
        myPostView.customTagButton.addTarget(self, action: #selector(customTagButtonDidTap), for: .touchUpInside)
        
        myPostView.uploadButton.addTarget(self, action: #selector(uploadButtonDidTap), for: .touchUpInside)
    }
    
}

private extension MyPostViewController {
    
    func setupGesture() {
        let todayLookTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageDidTap))
        myPostView.todayLookImageView.isUserInteractionEnabled = true
        myPostView.todayLookImageView.addGestureRecognizer(todayLookTapGesture)
        myPostView.todayLookImageView.delegate = myPostView
        myPostView.customTagTextField.delegate = self
        myPostView.locationTextField.delegate = self
        hideKeyboardWhenTappedAround()
        
        let dateTapGesture = UITapGestureRecognizer(target: self, action: #selector(dateInfoViewTapped))
        myPostView.dateInfoView.isUserInteractionEnabled = true
        myPostView.dateInfoView.addGestureRecognizer(dateTapGesture)
        
        let feelsLikeTapGesture = UITapGestureRecognizer(target: self, action: #selector(feelsLikeViewTapped))
        myPostView.feelsLikeView.isUserInteractionEnabled = true
        myPostView.feelsLikeView.addGestureRecognizer(feelsLikeTapGesture)
    }
    
    @objc func customTagButtonDidTap() {
        guard let tagText = myPostView.customTagTextField.text, !tagText.isEmpty else { return }
        let newTagLabel = myPostView.createTagLabel(withText: tagText)
        myPostView.todayLookImageView.addSubview(newTagLabel)
        myPostView.positionTagView(newTagLabel, within: myPostView.todayLookImageView)
        
        newTagLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        myPostView.customTagTextField.text = ""
        myPostView.customTagButton.isEnabled = false
    }
    
    @objc private func uploadButtonDidTap() {
        
    }
    
    @objc func imageDidTap() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default) { action in
            self.openLibrary()
        }
        let camera = UIAlertAction(title: "카메라", style: .default) { action in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    @objc private func dateInfoViewTapped() {
        let calendarVC = CalendarViewController()
        calendarVC.delegate = self
        if let sheet = calendarVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 30
            sheet.prefersGrabberVisible = true
        }
        present(calendarVC, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func feelsLikeViewTapped() {
        if isDropdownMenuOpen {
            closeDropdownMenu()
        } else {
            openDropdownMenu()
        }
        
        isDropdownMenuOpen.toggle()
    }
    
    private func openDropdownMenu() {
        UIView.transition(with: shadowBackgroundView, duration: 0.2, options: [.transitionCrossDissolve]) {
            self.shadowBackgroundView.isHidden = false
        }
        
        UIView.transition(with: dropdownTableView, duration: 0.2, options: [.transitionCrossDissolve]) {
            self.dropdownTableView.isHidden = false
        }
        
        UIView.transition(with: myPostView.downArrowImageView, duration: 0.2, options: [.transitionCrossDissolve]) {
            self.myPostView.downArrowImageView.image = UIImage(named: "up")
        }
        
        UIView.transition(with: myPostView.feelsLikeInfoView, duration: 0.2, options: [.transitionCrossDissolve]) {
            self.myPostView.feelsLikeInfoView.layer.borderColor = UIColor(red: 0.444, green: 0.607, blue: 0.901, alpha: 1).cgColor
        }
    }
    
    private func closeDropdownMenu() {
        UIView.transition(with: shadowBackgroundView, duration: 0.2, options: [.transitionCrossDissolve]) {
            self.shadowBackgroundView.isHidden = true
        }
        
        UIView.transition(with: dropdownTableView, duration: 0.2, options: [.transitionCrossDissolve]) {
            self.dropdownTableView.isHidden = true
        }
        
        UIView.transition(with: myPostView.downArrowImageView, duration: 0.2, options: [.transitionCrossDissolve]) {
            self.myPostView.downArrowImageView.image = UIImage(named: "down")
        }
        
        UIView.transition(with: myPostView.feelsLikeInfoView, duration: 0.2, options: [.transitionCrossDissolve]) {
            self.myPostView.feelsLikeInfoView.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        }
    }
    
}
