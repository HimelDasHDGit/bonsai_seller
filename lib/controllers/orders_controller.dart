import 'package:bonsai_seller/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrdersController extends GetxController {
  var orders = [];

  var confirmed = false.obs;
  var onDelivery = false.obs;
  var delivered = false.obs;

  getOrders(data) {
    orders.clear();
    for (var item in data['order']) {
      if (item['vender_id'] == currentUser!.uid) {
        orders.add(item);
      }
    }
  }

  changeOrderStatus({title,status,docId}) async{
    var store = firestore.collection(ordersCollection).doc(docId);
    await store.set({
      title:status
    },SetOptions(merge: true));
  }

}
