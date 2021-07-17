//
//  FirstVC.swift
//  AnimalDiary
//
//  Created by 김수정 on 2021/07/05.
//
import UIKit

class FirstVC: UIViewController {
    
    // MARK: - Properties
    let picker = UIImagePickerController()
    
    @IBOutlet weak var addDayBtn: UIButton!
    @IBOutlet weak var backgroundBtn: UIView!
    @IBOutlet weak var addAlbumBtn: UIButton!
    @IBOutlet weak var withUsLabel: UILabel!
    @IBOutlet weak var firstPageImageView: UIImageView!
    @IBOutlet weak var dDayLabel: UILabel!
    @IBOutlet weak var imageTextLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    var banners: [String] = ["banner1", "banner2", "banner3", "banner4", "banner5"]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setImageText()
        setStyle()
        pageControlInitLayout()
    }
    
    // MARK: - Function
    
    // pageControl 초기셋팅
    func pageControlInitLayout() {
        pageControl.numberOfPages = banners.count
        pageControl.currentPageIndicatorTintColor = .systemPurple
    }
    
    func setDelegate() {
        // collectionView Delegate & DataSource
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        // UIImagePicker Delegate
        picker.delegate = self
    }
    
    // UIImagePicker
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    // Style
    func setStyle() {
        backgroundBtn.layer.cornerRadius = backgroundBtn.frame.height/2
    }
    
    // imageText
    func setImageText() {
        if firstPageImageView.image != nil {
            imageTextLabel.isHidden = true
        }
        else {
            imageTextLabel.isHidden = false
        }
    }
    
    // MARK: - IBAction
    
    // datePicker
    @IBAction func addDatePickerBtn(_ sender: Any) {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.sizeToFit()

        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        alert.view.addSubview(datePicker)

        let ok = UIAlertAction(title: "확인", style: .default) { (action) in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            let dateString = dateFormatter.string(from: datePicker.date)
            print(dateString)
            
            if self.dDayLabel.text != nil {
                self.dDayLabel.text = dateString
                self.dDayLabel.isHidden = false
            }
            else {
                self.dDayLabel.isHidden = true
            }
        }

        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)

        alert.addAction(ok)
        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
    }
    
    // 사진 추가 버튼
    @IBAction func addAlbumBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default) {
            (action) in self.openLibrary()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UIImagePicker
extension FirstVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            firstPageImageView.image = image
            print(info)
            imageTextLabel.isHidden = true
            
        }
        dismiss(animated: true, completion: nil)
        
    }
}

// MARK: - UICollectionView DataSource
extension FirstVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCVCell.identifier, for: indexPath) as? bannerCVCell else {
            return UICollectionViewCell() }
        
        cell.setImage(imageName: banners[indexPath.item])
        
        return cell
    }
    
}

// MARK: - UICollectionView FlowLayout
extension FirstVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
}

// MARK:- UIScrollViewDelegate
extension FirstVC {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
