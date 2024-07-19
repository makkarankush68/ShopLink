import 'package:flutter/material.dart';
import 'category_item.dart';
import '../../../constant/img_constants.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "PRODUCTS",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        allProducts()
      ],
    );
  }

  Widget allProducts() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              CategoryItem(image: clothing, label: 'Clothing'),
              CategoryItem(image: personalCare, label: 'Personal Care'),
            ],
          ),
          Column(
            children: [
              CategoryItem(image: homeDecor, label: 'Home Decor is a long label'),
              CategoryItem(image: footwear, label: 'Footwear'),
            ],
          ),
          Column(
            children: [
              CategoryItem(image: toys, label: 'Toys'),
              CategoryItem(image: accessories, label: 'Accessories'),
            ],
          ),
          Column(
            children: [
              CategoryItem(image: clothing, label: 'Clothing'),
              CategoryItem(image: personalCare, label: 'Personal Care'),
            ],
          ),
          Column(
            children: [
              CategoryItem(image: homeDecor, label: 'Home Decor'),
              CategoryItem(image: footwear, label: 'Footwear'),
            ],
          ),
          Column(
            children: [
              CategoryItem(image: toys, label: 'Toys'),
              CategoryItem(image: accessories, label: 'Accessories'),
            ],
          ),
        ],
      ),
    );
  }
}

