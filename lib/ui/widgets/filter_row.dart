import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filterItem("Sort ▼"),
          filterItem("Rating 4+"),
          filterItem("Great Offers"),
          filterItem("Popular"),
          filterItem("Favorites"),
          filterItem("Gourmet"),
        ],
      ),
    );
  }

  Widget filterItem(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xfff7f2fa),
        border: Border.all(color: Colors.black54),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
