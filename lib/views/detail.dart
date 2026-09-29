import 'package:flutter/material.dart';
import 'package:lat_kuis/models/data.dart';

class DetailPage extends StatelessWidget {
  final Menu menus;

  const DetailPage({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menus.name)),
      body: Column(
        children: [Image.network(menus.image), Text("Rp ${menus.price}")],
      ),
    );
  }
}
