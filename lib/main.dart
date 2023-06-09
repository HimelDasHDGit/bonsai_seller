import 'package:bonsai_seller/views/auth_screen/login_screen.dart';
import 'package:bonsai_seller/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:bonsai_seller/const/const.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    entry();
  }

  var seller = false;

  entry()async{
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        seller = false;
      }  else{
        seller = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      home: seller? Home(): LoginScreen(),
    );
  }
}



//67:C3:C5:E9:6C:D7:66:FE:C1:7A:54:0D:A9:B5:07:FA:B3:50:EB:16