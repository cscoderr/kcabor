import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/categories/widgets/categories_list.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: KaborAppBar(title: 'Categories'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CategoriesCard(),
        ),
      ),
    );
  }
}
