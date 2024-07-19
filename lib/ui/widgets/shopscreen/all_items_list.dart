import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'product_item.dart';
import '../../../utils/list_of_products.dart';

class AllItemList extends StatefulWidget {
  const AllItemList({super.key});

  @override
  State<AllItemList> createState() => AllItemListState();
}

class AllItemListState extends State<AllItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Text(
        //     "Products",
        //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //   ),
        // ),
        const SizedBox(height: 10),
        allProducts(),
      ],
    );
  }

  Widget allProducts() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 14,
          childAspectRatio: 2 / 3,
          mainAxisExtent: 250),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(
          image: products[index]['image'],
          label: products[index]['label'],
          price: products[index]['price'],
          rating: products[index]['rating'],
          ratingCount: products[index]['ratingCount'],
          offer: products[index]['offer'],
        );
      },
    );
  }
}
