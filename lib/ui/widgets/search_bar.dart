import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: const TextField(
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            height: 1,
          ),
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
