import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/controllers/auth_controller.dart';
import 'package:bonsai_seller/views/home_screen/home.dart';
import 'package:bonsai_seller/views/widgets/button.dart';
import 'package:get/get.dart';

import '../../const/images.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());



    return  Scaffold(
      backgroundColor: green,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  const EdgeInsets.all(12.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.heightBox,
                normalText(text: welcome,size: 18.0),
                20.heightBox,
                Row(
                  children: [
                    Image.asset(logo,height: 60,width: 60,).box.border(color: white).roundedFull.padding(const EdgeInsets.all(8)).make(),
                    10.widthBox,
                    boldText(text: appname,size: 20.0),
                  ],
                ),
                60.heightBox,
                Obx(
                    ()=> Column(
                    children: [

                      normalText(text: loginHint,size: 18.0,color: green),
                      10.heightBox,

                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Vx.green100,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email,color: green,),
                          hintText: emailHint,
                        ),
                      ),
                      10.heightBox,
                      TextFormField(
                        obscureText: controller.isObscured.value,
                        controller: controller.passwordController,
                        decoration:  InputDecoration(
                          filled: true,
                          fillColor: Vx.green100,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,color: green,),
                          hintText: passwordHint,
                        ),
                      ),
                      TextButton(onPressed: (){}, child:
                      Align(
                        child: normalText(text: forgotPassword,color: green),
                      )
                      ),
                      30.heightBox,
                      SizedBox(
                        width: context.screenWidth-100,
                        child: controller.isLoading.value ? loadingIndicator():button(
                          onPress: ()async {
                            controller.isLoading(true);
                            await controller.loginMethod(context: context).then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: loggedIn,textColor: green,showTime: 5000);
                                controller.isLoading(false);
                                Get.offAll(()=> const Home());
                              }  else{
                                controller.isLoading(false);
                            }
                            });
                          },
                          title: login,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ).box.white.rounded.shadowMd.padding(const EdgeInsets.all(8)).make(),
                ),
                30.heightBox,
                Center(child: normalText(text: anyProblem)),
                100.heightBox,
                Center(child: boldText(text: credit)),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
