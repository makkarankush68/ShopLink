import 'package:flutter/material.dart';
import '../filter_row.dart';
import 'shop_card.dart';
import '../../../utils/list_of_shops.dart';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'EXPLORE NEARBY',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const FilterRow(),
            const SizedBox(height: 16),
            ...allShops.map((shop) => ShopCard(shop: shop)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
