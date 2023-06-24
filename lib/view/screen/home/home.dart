import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_test/utill/app_constans.dart';
import 'package:ososs_test/utill/dimensions.dart';
import 'package:ososs_test/utill/color_resources.dart';
import 'package:ososs_test/view/basewidget/custom_text_field.dart';
import 'package:ososs_test/view/screen/home/widget/clear_text.dart';
import 'package:ososs_test/view/screen/animations/animations.dart';
import 'package:ososs_test/view/screen/pokemon/pkoemon.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../basewidget/custom_app_bar.dart';
import '../../basewidget/filled_button.dart';

TextEditingController nameController = TextEditingController();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: Scaffold(
          appBar:CustomAppBar(text:AppConstants.AppBar_Label_Home,),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(Dimensions.HOME_PAGE_PADDING),
                child: Column(
                  children: [
                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),

                    CustomTextField(controller: nameController,hintTxt: AppConstants.HOME_PAGE_TEXT_FORM,textInputAction:  TextInputAction.done,onChange:  (value) {
                      context.read<HomeBloc>().add(NameEvent(value));
                    }),

                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_LARGE,
                    ),

                    Text(context.read<HomeBloc>().name_text ??= AppConstants.EMPTY_NAME,style: const TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT),),

                    const Spacer(),

                    ClearText(
                      onTap: () {
                        nameController.clear();
                        context.read<HomeBloc>().add(NameEvent(null));
                      },
                    ),

                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),

                    CustomFilledButton(AppConstants.HOME_BOUTTON_1,ColorResources.Home_BUTTON_PAGE_1,() {
                      var name=context.read<HomeBloc>().name_text;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Animations(name: name??"",)));
                    }),

                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),

                    CustomFilledButton(AppConstants.HOME_BOUTTON_2,ColorResources.Home_BUTTON_PAGE_2,()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const Pokemon()))),

                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
