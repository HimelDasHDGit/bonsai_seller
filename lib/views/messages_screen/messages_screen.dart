import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/services/bonsai_server.dart';
import 'package:bonsai_seller/views/messages_screen/chats_screen.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

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
          text: messages,
          size: 16.0,
          color: green,
        ),
      ),
      body: StreamBuilder(
          stream: BonsaiServer.getMessages(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {

              var data = snapshot.data!.docs;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                        data.length, (index) {

                      var timeData = data[index]['created_on'] == null
                          ? DateTime.now()
                          : data[index]["created_on"].toDate();
                      var time =
                          intl.DateFormat("h:mma : d MMM").format(timeData);

                      return ListTile(
                        onTap: () {
                          Get.to(() => const ChatsScreen(), arguments: [data[index]['sender_Nmae'],data[index]['fromId']]);
                        },
                        leading: const CircleAvatar(
                          backgroundColor: green,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        title: boldText(
                            text: "${data[index]['sender_Nmae']}",
                            color: green),
                        subtitle: normalText(
                            text: "${data[index]['last_msg']}",
                            color: green.withOpacity(.7)),
                        trailing:
                            normalText(text: time, color: green, size: 8.0),
                      );
                    }),
                  ),
                ),
              );
            }
          }),
    );
  }
}
