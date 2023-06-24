import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color color;

  CustomFilledButton(this.text, this.color,this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: onTap,
            child: Center(child: Text(text,style: const TextStyle(fontSize: 20,color: Colors.white),)),
          )
        )
      ),
    );
  }
}
