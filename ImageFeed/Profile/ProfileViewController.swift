import UIKit

final class ProfileViewController: UIViewController {
    private let profileService = ProfileService.shared
    
    private lazy var avatarView: UIImageView = {
        let profileImage = UIImage(named: "avatar")
        let imageView = UIImageView(image: profileImage)
        imageView.tintColor = .gray
        return imageView
    } ()
    
    private lazy var profileName: UILabel = {
        let profileName = UILabel()
        profileName.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        profileName.textColor = .white
        return profileName
    } ()
    
    private lazy var profileTag: UILabel = {
        let profileTag = UILabel()
        profileTag.font = UIFont.systemFont(ofSize: 13)
        profileTag.textColor = UIColor(named: "LoginName")
        return profileTag
    } ()
    
    private lazy var profileInfo: UILabel = {
        let profileInfo = UILabel()
        profileInfo.font = UIFont.systemFont(ofSize: 13)
        profileInfo.textColor = .white
        return profileInfo
    } ()
    
    private lazy var logoutButton: UIButton = {
        let logoutButton = UIButton.systemButton(
            with: UIImage(named: "logout") ?? UIImage(),
            target: ProfileViewController.self,
            action: #selector(Self.didTapButton)
        )
        logoutButton.tintColor = UIColor(named: "LogoutButtonColor")
        return logoutButton
    } ()
    
    private func updateProfileDetails() {
        guard let profile = profileService.profile else { return }
        profileName.text = profileService.profile?.name
        profileTag.text = profileService.profile?.loginName
        profileInfo.text = profileService.profile?.bio
    }
    
    private func addViews() {
        [avatarView,
         profileName,
         profileTag,
         profileInfo,
         logoutButton].map{self.view.addSubview($0)}
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            avatarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarView.heightAnchor.constraint(equalToConstant: 70),
            avatarView.widthAnchor.constraint(equalToConstant: 70),
            
            profileName.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 8),
            profileName.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor),
            profileName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            
            profileTag.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 8),
            profileTag.leadingAnchor.constraint(equalTo: profileName.leadingAnchor),
            profileTag.trailingAnchor.constraint(equalTo: profileName.trailingAnchor),
            
            profileInfo.topAnchor.constraint(equalTo: profileTag.bottomAnchor, constant: 8),
            profileInfo.leadingAnchor.constraint(equalTo: profileName.leadingAnchor),
            profileInfo.trailingAnchor.constraint(equalTo: profileName.trailingAnchor),
            
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateProfileDetails()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        applyConstraints()
        updateProfileDetails()
    }
    
    @objc private func didTapButton() {}
}
