import 'package:flutter/material.dart';
import 'package:ososs_test/utill/Dimensions.dart';

class ClearText extends StatelessWidget {
  final void Function() onTap;
  const ClearText({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete,color: Colors.red,size: 30,),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
          Text("Clear text",style: TextStyle(color: Colors.red,fontSize: 22),)
        ],
      ),
    );
  }
}
