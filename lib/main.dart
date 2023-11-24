import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pokemon/features/home/data/data_sources/characters_remote_data_source.dart';
// import 'package:pokemon/features/home/data/repository_implement/characters_repository_implement.dart';
// import 'package:pokemon/features/home/domain/use_cases/characters_usecase.dart';
import 'package:pokemon/features/home/presentation/manager/characters_bloc/characters_bloc.dart';
import 'package:pokemon/features/home/presentation/view/characters_screen.dart';
//import 'package:pokemon/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  // var characterDetailsUseCase = CharacterDetailsUseCase(
  //     charactersRepository: CharactersRepositoryImplement());
  // var resulte = await characterDetailsUseCase(
  //     CharacterDetailsParams(url: 'https://pokeapi.co/api/v2/pokemon/201/'));
  // resulte.fold((l) => null, (r) {
  //   print('------------------------------------');
  //   print(r.height);
  // });
  // Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
