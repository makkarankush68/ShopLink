import 'package:flutter/material.dart';
import 'package:kmdha/ui/screens/product_screen.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;
  const CategoryItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(label: label),
            ));
      },
      child: Container(
        width: screenWidth / 3.5 > 90 || screenWidth / 3.5 < 60
            ? 90
            : screenWidth / 3.5,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(image),
            ),
            SizedBox(
              height: 46,
              child: Text(
                label,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
