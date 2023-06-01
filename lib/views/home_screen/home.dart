
import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/controllers/home_controller.dart';
import 'package:bonsai_seller/views/home_screen/home_screen.dart';
import 'package:bonsai_seller/views/orders_screen/orders_screen.dart';
import 'package:bonsai_seller/views/products_screen/products_screen.dart';
import 'package:bonsai_seller/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navScreens = [
      const HomeScreen(),
      const ProductsScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
    ];

    var bottomNavBar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home,size: 20,),
        label: dashboard,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(iCproducts,height: 20,width: 20,color: green,),
        label: products,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(iCorders,height: 20,width: 20,color: green,),
        label: orders,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(generalSetting,height: 20,width: 20,color: green,),
        label: settings,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child: navScreens.elementAt(controller.navIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          currentIndex: controller.navIndex.value,
          onTap: (index){
            controller.navIndex.value = index;
          },
          type: BottomNavigationBarType.shifting,
          items: bottomNavBar,
          selectedItemColor: green,
          unselectedItemColor: darkGrey,
        ),
      ),
    );
  }
}

//hhh