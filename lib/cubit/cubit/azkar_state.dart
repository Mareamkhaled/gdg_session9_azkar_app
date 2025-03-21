part of 'azkar_cubit.dart';

@immutable
sealed class AzkarState extends Equatable {
  final int counter;
  final bool? isSpeaking;
  const AzkarState({required this.counter, this.isSpeaking = false});
  @override
  List<Object?> get props => [counter];
}

final class AzkarInitial extends AzkarState {
  const AzkarInitial() : super(counter: 0);
}

final class AzkarUpdate extends AzkarState {
  // const AzkarUpdate({required super.counter});
  const AzkarUpdate({required super.counter, super.isSpeaking});
}
