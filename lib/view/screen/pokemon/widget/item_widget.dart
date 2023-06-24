import 'package:flutter/material.dart';
import 'package:ososs_test/helper/model/pokemon_modle.dart';
import 'package:ososs_test/utill/Dimensions.dart';
import 'package:ososs_test/utill/app_constans.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, this.model});
  final PokemonModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "${AppConstants.GET_IMAGE_URL}${model?.id}.png",
                height: 130,
                width: 130,
                fit: BoxFit.fitHeight,
                frameBuilder: (BuildContext context, Widget child, int? frame, bool? wasSynchronouslyLoaded) {
                  if (frame == null) {
                    return Image.asset(
                      AppConstants.PLACEHOLDER_IMAGE,
                      height: 120,
                      width: 120,
                      fit: BoxFit.fitHeight,
                    );
                  } else {
                    return child;
                  }
                },
              ),
            ),
            const SizedBox(
              width: Dimensions.PADDING_SIZE_SMALL,
            ),
            Text(model?.name ?? "UNKNOWN"),
          ],
        ),
      ),
    );
  }
}
