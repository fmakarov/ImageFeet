import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private var LogoutBtn: UIButton!
    @IBOutlet private var LoginLabel: UILabel!
    @IBOutlet private var NameLabel: UILabel!
    @IBOutlet private var AvatarImage: UIImageView!
    @IBOutlet private var DescriptionLabel: UILabel!
    
    private var label: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ProfileImage = UIImage(named: "avatar")
        let imageView = UIImageView(image: ProfileImage)
        
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        let NameLabel = UILabel()
        NameLabel.text = "Екатерина Новикова"
        NameLabel.font = UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.semibold)
        NameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(NameLabel)
        NSLayoutConstraint.activate([
            NameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            NameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            NameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
        self.NameLabel = NameLabel
        
        let LoginLabel = UILabel()
        LoginLabel.text = "@ekaterina_nov"
        LoginLabel.textColor = UIColor(named: "LoginName")
        LoginLabel.font = UIFont.systemFont(ofSize: 13)
        LoginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(LoginLabel)
        
        NSLayoutConstraint.activate([
            LoginLabel.trailingAnchor.constraint(equalTo: NameLabel.trailingAnchor),
            LoginLabel.topAnchor.constraint(equalTo: NameLabel.bottomAnchor, constant: 8),
            LoginLabel.leadingAnchor.constraint(equalTo: NameLabel.leadingAnchor)
        ])
        
        let DescriptionLabel = UILabel()
        DescriptionLabel.text = "Hello, World!"
        DescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        DescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(DescriptionLabel)
        
        NSLayoutConstraint.activate([
            DescriptionLabel.leadingAnchor.constraint(equalTo: LoginLabel.leadingAnchor),
            DescriptionLabel.topAnchor.constraint(equalTo: LoginLabel.bottomAnchor, constant: 8)
        ])
        
        
        let LogoutBtn = UIButton.systemButton(
            with: UIImage(named: "logout")!,
            target: self,
            action: Selector?.none
        )
        
        LogoutBtn.tintColor = UIColor(named: "LogoutButtonColor")
        LogoutBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(LogoutBtn)
        LogoutBtn.widthAnchor.constraint(equalToConstant: 24).isActive = true
        LogoutBtn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        LogoutBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        LogoutBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55).isActive = true
    }
    @objc
    private func didTapButton() {
        LoginLabel?.removeFromSuperview()
        LoginLabel = nil
    }
    
    @IBAction func DidTapLogoutButton() {
    }
}
