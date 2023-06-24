import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_test/utill/dimensions.dart';
import 'package:ososs_test/view/screen/pokemon/widget/item_widget.dart';
import 'package:ososs_test/view/screen/pokemon/widget/show_more.dart';

import '../../../bloc/Pokemon/pokemon_bloc.dart';
import '../../../utill/app_constans.dart';
import '../../basewidget/custom_app_bar.dart';

class Pokemon extends StatelessWidget {
  const Pokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(text: AppConstants.AppBar_Label_Page2),
        body: BlocProvider(
          create: (context) =>
          PokemonBloc()
            ..add(InitPokemonList()),
          child: BlocConsumer<PokemonBloc, PokemonState>(
            listener: (context, state) {
              if(state is ErrorGetPokemon){
                showDialog(context: context, builder: (_)=>AlertDialog(
                  title: const Text(AppConstants.ERROR_GET_LIST_MESSAGE),
                  actions: [
                    FilledButton(onPressed: (){
                      Navigator.pop(context);
                      context.read<PokemonBloc>().add(InitPokemonList());
                    }, child: const Text("Try Again"))
                  ],
                ));
              }
            },
            builder: (context, state) {
              if(context.read<PokemonBloc>().pokemonList.isEmpty)
                {
                  return const Center(child: CircularProgressIndicator(),);
                }
              else {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var model = context.read<PokemonBloc>().pokemonList[index];
                        return ItemWidget(model:model);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 2);
                      },
                      itemCount: context.read<PokemonBloc>().pokemonList.length),
                    const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
                    ShowMore(onTap: (){
                      context.read<PokemonBloc>().add(InitPokemonList());
                    }),

                  ],
                );
              }
            },
          ),
        ));
  }
}
