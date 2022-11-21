class UserInfo {
  String Username = '';
  String DisplayName = '';
  String Password = '';
  int HighestScore = 0;

  UserInfo();
  UserInfo.fromMap(Map<String, dynamic> map) {
    Username = map['username'];
    DisplayName = map['display_name'];
    Password = map['password'];
    HighestScore = map['highest_score'];
  }

  Map<String, dynamic> toMap() {
    return {
      'username': Username,
      'display_name' : DisplayName,
      'password' : Password,
      'highest_score' : HighestScore
    };
  }
}