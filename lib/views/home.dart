import 'package:flutter/material.dart';
import 'package:lat_kuis/views/detail.dart';

import '../models/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(menus: menus[index]),
              ),
            );
          },
          title: Text(menus[index].name),
          subtitle: Text("Rp ${menus[index].price}"),
          leading: Image.network(menus[index].image, width: 100, height: 100),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Home"),
    //   ),
    //   body: ListView.builder(
    //     itemCount: products.length,
    //     itemBuilder:(context, index) {
    //       return ListTile(
    //         onTap:() {
    //           Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => DetailPage(product: products[index])));
    //         },
    //         title: Text(products[index].name),
    //         subtitle: Text("Rp ${products[index].price}"),
    //         leading: Image.network(
    //           products[index].image,
    //           width: 100,
    //           height: 100,
    //         ),
    //         trailing: Icon(Icons.arrow_forward_ios)
    //       );
    //     },
    //   ),
    // );
  }
}
