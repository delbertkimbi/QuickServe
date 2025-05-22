import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String text;
  final String image;
  const CategoryWidget({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 90,
          width: 90,
          margin: const EdgeInsets.only(left: 20),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Image.network(image, height: 90, width: 90, fit: BoxFit.cover),
        ),
        Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
