import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter_firestore/QuestionAnswer.dart';
import 'package:test_flutter_firestore/UserInfo.dart';

Future<UserInfo> GetUserInfo(String username, String password) async{
  var result = await FirebaseFirestore.instance.collection('/UserInfo').where('username', isEqualTo: username).where('password', isEqualTo: password).get();
  if (result.docs.isNotEmpty) {
    return UserInfo.fromMap(result.docs[0].data());
  }
  return UserInfo();
}

Future<bool> SignUp(UserInfo user) async{
  var result = await FirebaseFirestore.instance.collection('UserInfo').where('username', isEqualTo: user.Username).get();
  if (result.docs.length == 0) {
    await FirebaseFirestore.instance.collection('UserInfo').doc().set(user.toMap());
    return true;
  }
  return false;
}

Future<List<UserInfo>> GetLeaderBoard({max_result:100}) async{
  var result = await FirebaseFirestore.instance.collection('/UserInfo').orderBy('highest_score', descending: true).limit(max_result).get();
  List<UserInfo> users = <UserInfo>[];
  for (var record in result.docs) {
    users.add(UserInfo.fromMap(record.data()));
  }
  return users;
}

Future<List<QuestionAnswer>> GetQuestionAnswerList() async{
  var result = await FirebaseFirestore.instance.collection('/Q&A').get();
  List<QuestionAnswer> qas = <QuestionAnswer>[];
  for (var record in result.docs) {
    qas.add(QuestionAnswer.fromMap(record.data(), record.id));
  }
  return qas;
}

