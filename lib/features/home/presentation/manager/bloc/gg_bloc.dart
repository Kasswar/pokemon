import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gg_event.dart';
part 'gg_state.dart';

class GgBloc extends Bloc<GgEvent, GgState> {
  GgBloc() : super(GgInitial()) {
    on<GgEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
