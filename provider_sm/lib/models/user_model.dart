class UserModel{
  final String? login;
  final String? profile_url;
  final int? followers;
  final int? following;
  final int? repos;
  UserModel({
    this.login,
    this.profile_url,
    this.following,
    this.repos,
    this.followers
  });
}

final users =<UserModel>[
  UserModel()
];