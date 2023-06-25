import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/messages_screen/chats_screen.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: const Icon(
              Icons.arrow_back,
              color: green,
            )
        ),
        title: boldText(
          text: messages,
          size: 16.0,
          color: green,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20,
                    (index) => ListTile(
                      onTap: (){
                        Get.to(()=> const ChatsScreen());
                      },
                      leading: const CircleAvatar(backgroundColor: green, child: Icon(Icons.person,color: Colors.white,),),
                      title: boldText(text: "Username", color: green),
                      subtitle: normalText(text: "Last message...",color: green.withOpacity(.7)),
                      trailing: normalText(text: "10.45-PM",color: green),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
