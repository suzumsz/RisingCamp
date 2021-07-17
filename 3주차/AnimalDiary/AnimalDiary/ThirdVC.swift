//
//  ThirdVC.swift
//  AnimalDiary
//
//  Created by 김수정 on 2021/07/05.
//

import UIKit

// MARK: - Protocol

// 1. 프로토콜을 만든다.
protocol ThirdVCDelegate: AnyObject {
    
    // 2. 원하는 메소드를 만든다.
    func thirdVCPassDataToSecondVC(dateLabel: String?, titleText: String?, locationText: String?, imageView:UIImage?, contentText:String?, index:Int?)
}

class ThirdVC: UIViewController {
    
    // MARK: - Properties
    
    var idx : Int? // 셀의 인덱스를 받아옴
    
    // 데이터를 가져올 때 옵셔널 에러를 없애기 위한 변수
    //  var date1 : String?
    var titleTitle : String?
    var locationLocation : String?
    var imageImage : UIImage?
    var contentContent :String?
    
    // 앨범에서 사진 가져오기 위한 변수
    let picker = UIImagePickerController()
    
    // 3. 델리게이트
    weak var delegate: ThirdVCDelegate?
    
    // IBOulet
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var imageTextLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 앨범에서 사진 가져오기 위해
        picker.delegate = self
        
        // 날짜 및 시간
        nowDateFormatter()
        
        // 선언한 변수들에게 값 넣어주기
        optionalErrorVar()
        
        // placeholder
        textFieldPlaceHolderSetting()
        textViewPlaceHolderSetting()
        
        // image에 사진 추가해달라는 Label 문구
        setImageText()
    }
    
    // MARK: - IBAction
    
    // 제목 입력 값
    @IBAction func titleTextField(_ sender: UITextField) {
        print("제목>> \(titleTextField.text) ")
    }
    
    // 위치 입력 값
    @IBAction func locationTextField(_ sender: UITextField) {
        print("위치>> \(locationTextField.text) ")
    }
    
    // 취소 버튼
    @IBAction func cancleBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 사진 추가 버튼
    @IBAction func addImageBtn(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default) {
            (action) in self.openLibrary()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    // 저장 버튼
    @IBAction func didPressSaveBtn(_ sender: Any) {
        
        /// 프로토콜에 있는 메소드를 호출한다. 호출 할 때, 현재 텍스트필드에 입력된 값을 할당한다.
        
        print("저장버튼눌렀을때 인덱스", idx ?? -99)
        delegate?.thirdVCPassDataToSecondVC(dateLabel: dateLabel.text, titleText: titleTextField.text, locationText: locationTextField.text, imageView: imageView.image, contentText: contentTextView.text, index: idx)
        
        // 현재 Controller를 메모리에서 해제한다.
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Function
    
    // Date & Time
    func nowDateFormatter() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        let current_date_string = formatter.string(from: Date())
        print(current_date_string)
        dateLabel.text = current_date_string
    }
    
    // TextView의 PlaceHolder
    func textViewPlaceHolderSetting() {
        if contentTextView.text.isEmpty == true {
            contentTextView.delegate = self
            contentTextView.text = "내용을 입력해주세요."
            contentTextView.textColor = UIColor.lightGray
        }
    }
    
    // TextField의 PlaceHolder
    func textFieldPlaceHolderSetting() {
        titleTextField.placeholder = "제목을 입력해주세요."
        locationTextField.placeholder = "위치를 입력해주세요."
    }
    
    // 옵셔널 에러로 인해 선언한 변수들에게 값 넣어주기
    func optionalErrorVar() {
        titleTextField.text = titleTitle
        locationTextField.text = locationLocation
        imageView.image = imageImage
        contentTextView.text = contentContent
    }
    
    func setImageText() {
        if imageView.image != nil {
            imageTextLabel.isHidden = true
        }
        else {
            imageTextLabel.isHidden = false
        }
    }
}

// MARK: - UIImagePickerDelegate

extension ThirdVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imageView.image = image
            print(info)
            
            // 사진이 있을 때 글자 없앰
            imageTextLabel.isHidden = true
        }
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITextViewDelegate

extension ThirdVC : UITextViewDelegate {

    // TextView PlaceHolder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextView.textColor == UIColor.lightGray {
            contentTextView.text = nil
            contentTextView.textColor = UIColor.black
        }
    }

    // TextView PlaceHolder
    func textViewDidEndEditing(_ textView: UITextView) {
        if contentTextView.text.isEmpty {
            contentTextView.text = "내용을 입력해주세요."
            contentTextView.textColor = UIColor.lightGray
        }
    }
}
