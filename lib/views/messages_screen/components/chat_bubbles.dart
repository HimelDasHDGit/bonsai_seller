import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/controllers/chats_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

Widget senderBubble(DocumentSnapshot data) {

  var controller = Get.find<ChatsController>();

  var t = data['created_on'] == null? DateTime.now() : data['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(t);

  return Directionality(
    textDirection: data['uid'] == controller.friendId? TextDirection.ltr : TextDirection.ltr,
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: data['uid'] == controller.friendId? red : golden,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "${data['msg']}".text.color(white).size(16).make(),
          10.heightBox,
          time.text.color(white.withOpacity(0.5)).size(5).make(),
        ],
      ),
    ),
  );
}

// data['uid'] == controller.friendId? TextDirection.ltr :
//color: data['toId'] == controller.friendId? red : fontGrey,