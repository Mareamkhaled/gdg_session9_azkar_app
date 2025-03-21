import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'azkar_state.dart';

class AzkarCubit extends HydratedCubit<AzkarState> {
  final String id;

  AzkarCubit({required this.id}) : super(AzkarInitial());

  addCounter() {
    emit(AzkarUpdate(counter: state.counter + 1, isSpeaking: false));
  }

  resetCounter() {
    emit(AzkarUpdate(isSpeaking: false, counter: 0));
  }

  FlutterTts flutterTts = FlutterTts();

  void speak(String text) async {
    await flutterTts.setLanguage("ar");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);

    emit(AzkarUpdate(counter: state.counter, isSpeaking: true));
  }

  @override
  AzkarState? fromJson(Map<String, dynamic> json) {
    if (json['id'] == id) {
      return AzkarUpdate(counter: json['counter']);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AzkarState state) {
    return {
      'id': id,
      'counter': state.counter,
    };
  }
}
