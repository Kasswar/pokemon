import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/app_bar.dart';
import 'package:pokemon/core/constants/app_colors.dart';
import 'package:pokemon/core/functions/gemnerat_color.dart';
import 'package:pokemon/core/functions/generate_image_assets.dart';
import 'package:pokemon/features/home/presentation/manager/characters_bloc/characters_bloc.dart';
import 'package:pokemon/features/home/presentation/view/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<CharactersBloc>(context).add(GetCharactersEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.backGround,
        appBar: const AppBarApp(),
        body: BlocBuilder<CharactersBloc, GetCharactersState>(
          builder: (context, state) {
            if ((state.charactersStatus == CharactersStatus.initial ||
                    state.charactersStatus == CharactersStatus.loading) &&
                state.characters.isEmpty) {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.black,
              ));
            }
            if (state.charactersStatus == CharactersStatus.failure &&
                state.characters.isEmpty) {
              return Center(
                child: MaterialButton(
                  onPressed: () => BlocProvider.of<CharactersBloc>(context)
                      .add(GetCharactersEvent(isReload: true)),
                  color: AppColors.black,
                  child: Text(
                    "Reload",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              );
            }
            return ListView.builder(
                itemCount: state.characters.length + (state.isEndPage ? 0 : 1),
                itemBuilder: (context, i) {
                  if (state.characters.length == i) {
                    BlocProvider.of<CharactersBloc>(context)
                        .add(GetCharactersEvent());
                    return const CircularProgressIndicator();
                  }

                  return CustomCardCharacters(
                    key: Key(i.toString()),
                    image: generatImages(i),
                    color: generatColors(i),
                    characterDetailsState: state.characters[i],
                    index: i,
                  );
                });
          },
        ),
      ),
    );
  }
}
