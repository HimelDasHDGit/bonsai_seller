import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/views/widgets/appbar.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        backgroundColor: green,
        child: const Icon(Icons.add,),
      ),
      appBar: appBar(title: products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children:List.generate(20, (index) => ListTile(
              onTap:(){},
              leading: Image.asset(product,width: 100,height: 100,fit: BoxFit.cover,),
              title: boldText(text: "Product name",color: green,),
              subtitle: normalText(text: "\$699.00",color: golden),
            ),),
          ),
        ),
      ),
    );
  }
}
