import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_test/helper/model/square_type_model.dart';
import 'package:ososs_test/utill/Dimensions.dart';
import 'package:ososs_test/utill/app_constans.dart';
import 'package:ososs_test/view/basewidget/custom_app_bar.dart';
import 'package:ososs_test/view/screen/animations/widget/square_shape.dart';

import '../../../bloc/animations/animations_bloc.dart';


class Animations extends StatelessWidget {
  final String name;

  const Animations({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimationsBloc(),
      child: BlocBuilder<AnimationsBloc, AnimationsState>(
        builder: (context, state) {
          SquareTypeModel? model = context.read<AnimationsBloc>().square;
          return Scaffold(
              appBar: CustomAppBar(text: AppConstants.AppBar_Label_Page1),
              body: Container(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height:Dimensions.PADDING_SIZE_DEFAULT,),

                    Text(name, style: const TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT),),

                    const SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE,),

                    AnimatedContainer(duration: const Duration(milliseconds: 500), height: 330, width: 330, decoration: BoxDecoration( color: model!.color,borderRadius: BorderRadius.circular(model.round.toDouble())),),

                   const Spacer(),

                    SquareShape(onTap:(value)=>context.read<AnimationsBloc>().add(UpdateSquareEvent(value))),

                    const SizedBox(height:Dimensions.PADDING_SIZE_OVER_LARGE,),

                  ],
                ),
              ));
        },
      ),
    );
  }
}