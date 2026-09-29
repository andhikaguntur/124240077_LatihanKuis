import 'package:flutter/material.dart';
import 'package:lat_kuis/models/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        final menu = menus[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(12),
          title: Text(menu.name),
          subtitle: Text(menu.price),
          leading: Image.network(menus[index].image, width: 100, height: 100),
          trailing: const Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
