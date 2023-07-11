import 'package:bonsai_seller/const/const.dart';

class BonsaiServer {
  static sellerProfile(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .get();
  }

  //get all chat messages
  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: true)
        .snapshots();
  }

  static getMessages(uid) {
    return firestore
        .collection(chatsCollection)
        .where('toId', isEqualTo: uid)
        .snapshots();
  }

  static getOrders(uid) {
    return firestore
        .collection(ordersCollection)
        .where('venders', arrayContains: uid)
        .snapshots();
  }

  static getProducts(uid) {
    return firestore
        .collection(productsCollection)
        .where('vender_id', isEqualTo: uid)
        .snapshots();
  }
}
