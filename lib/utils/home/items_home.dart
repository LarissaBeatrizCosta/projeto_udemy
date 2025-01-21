import 'package:flutter/material.dart';

class ItemsHome extends StatelessWidget {
  const ItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.80,
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for(int i = 0; i< 6; i++)
        Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ) ,
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
        ),
      ],
    );
  }
}
