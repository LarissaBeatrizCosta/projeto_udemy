import 'package:flutter/material.dart';

class CarouselHome extends StatelessWidget{
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselView(
      itemExtent: MediaQuery.sizeOf(context).width - 32,
      itemSnapping: true,
      padding: EdgeInsets.all(4),
      children: List.generate(
        4,
            (int index) {
          return Container(
            color: Colors.amber,
            child: Image.asset(
              "assets/images/propaganda${index + 1}.png",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

}
