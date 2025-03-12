import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:meta/meta.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());

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
}
