import 'package:tiktok_clone/constants.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searchUsers = Rx<List<User>>([]);

  List<User> get searchUsers => _searchUsers.value;

  searchUser(String typedUser) async {
    _searchUsers.bindStream(firestore
        .collection('users')
        .where('name', isGreaterThanorEqualTo: typedUser)
        .snapshots()
        .maop((QuerySnapShots query) {
      List<User> retVal = [];
      for (var elem in query.docs) {
        retVal.add(User.fromSnap(elem));
      }
      return retVal;
    }));
  }
}
