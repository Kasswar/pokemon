import 'package:flutter/material.dart';
import 'package:pokemon/core/config/info_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/constants/app_colors.dart';
import 'package:pokemon/features/home/presentation/manager/characters_bloc/characters_bloc.dart';
//import 'package:pokemon/core/constants/app_colors.dart';

class CustomCardCharacters extends StatelessWidget {
  final Color color;
  final String image;
  final GetCharacterDetailsState characterDetailsState;
  final int index;
  //final CharacterDetailsState characterDetailsState;

  const CustomCardCharacters({
    super.key,
    required this.color,
    required this.image,
    required this.characterDetailsState,
    required this.index,
    //required this.characterDetailsState,
  });

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: ((context, deviceInfo) {
      return SizedBox(
        height: deviceInfo.screenHeight! / 7,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: InkWell(
                child: InfoWidget(builder: (context, deviceInfo) {
                  return Container(
                    height: deviceInfo.localHeight! * 0.6,
                    width: deviceInfo.localWidth! * 0.7,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          image,
                          height: MediaQuery.of(context).size.height / 8,
                        ),
                        BlocBuilder<CharactersBloc, GetCharactersState>(
                            builder: (context, state) {
                          if (characterDetailsState.charactersDetailsStatus ==
                                  CharactersDetailsStatus.initial ||
                              characterDetailsState.charactersDetailsStatus ==
                                  CharactersDetailsStatus.loading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (characterDetailsState.charactersDetailsStatus ==
                              CharactersDetailsStatus.failure) {
                            return Center(
                              child: Text(characterDetailsState.errorMsg),
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                characterDetailsState.details!.name!,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022),
                              ),
                              // Text('$index'),
                              Text(
                                characterDetailsState
                                    .details!.stats!.first.stat!.name!,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.028),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
