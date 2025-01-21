import 'package:flutter/cupertino.dart';

class ItemsHome extends StatelessWidget {
  const ItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.70,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
        ),
      ],
    );
  }
}
