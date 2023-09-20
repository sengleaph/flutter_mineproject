import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/cus_sliverbanner.dart';
import 'package:foodpanda_ui_clone/views/order_page/cart.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
