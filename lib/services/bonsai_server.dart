import 'package:bonsai_seller/const/const.dart';

class BonsaiServer {
  static sellerProfile(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .get();
  }
}
