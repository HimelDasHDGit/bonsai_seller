import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/messages_screen/components/chat_bubbles.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back,color: green,)),
        title: boldText(
          text: chatscreen,
          size: 16.0,
          color: green,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                  itemBuilder: (context, index) {
                    return chatBubble();
                  }
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Enter message",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: green),
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.send,color: green,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
