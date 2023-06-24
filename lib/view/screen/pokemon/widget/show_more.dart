import 'package:flutter/material.dart';
import 'package:ososs_test/utill/Dimensions.dart';

class ShowMore extends StatelessWidget {
  final void Function()? onTap;
  const ShowMore({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
  return InkWell(onTap: onTap,child: const Padding(
    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text("Show More",style: TextStyle(color: Colors.blue,fontSize: 20)),
          SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT,),
          Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,)
    ]),
  ),);
  }
}