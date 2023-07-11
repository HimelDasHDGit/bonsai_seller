import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/controllers/chats_controller.dart';
import 'package:bonsai_seller/services/bonsai_server.dart';
import 'package:bonsai_seller/views/messages_screen/components/chat_bubbles.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ChatsController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: green,
            )),
        title: boldText(
          text: "${controller.friendName}",
          size: 16.0,
          color: green,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => controller.isloading.value
                  ? Center(
                      child: loadingIndicator(),
                    )
                  : Expanded(
                      child: StreamBuilder(
                        stream: BonsaiServer.getChatMessages(
                            controller.chatDocId.toString()),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {

                          if (!snapshot.hasData) {
                            return Center(
                              child: loadingIndicator(),
                            );
                          }

                          else if (snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: "Send a message...".text.color(red).make(),
                            );
                          }

                          else {

                            return ListView(
                              reverse: true,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              children: snapshot.data!.docs
                                  .mapIndexed((currentValue, index) {

                                var data = snapshot.data!.docs[index];

                                return Align(
                                  alignment: data['uid'] == currentUser!.uid
                                      ? Alignment.bottomRight
                                      : Alignment.bottomLeft,
                                    child: senderBubble(data),
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ),
            ),
            10.heightBox,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.messagecontroller,
                    decoration: const InputDecoration(
                    hintText: "Type a message.",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: textfieldGrey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: green,
                      ),
                    )),
                  ),
                ),
                5.widthBox,
                ElevatedButton(
                  onPressed: () {
                    controller.sendMsg(controller.messagecontroller.text);
                    controller.messagecontroller.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    side: const BorderSide(
                      color: green,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: "Send".text.color(green).make(),
                ).box.roundedSM.height(80).make(),
              ],
            )
                .box
                .height(80)
                .padding(const EdgeInsets.all(12))
                .margin(const EdgeInsets.only(bottom: 8))
                .make(),
          ],
        ),
      ),
    );
  }
}
