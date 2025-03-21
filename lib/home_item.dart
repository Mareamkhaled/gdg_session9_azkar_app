import 'package:azkar/cubit/cubit/azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(id: text), // Pass a unique ID
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Image.asset("assets/quran.png"),
              Text(
                text,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              BlocBuilder<AzkarCubit, AzkarState>(
                builder: (context, state) {
                  return Text(
                    '${state.counter}',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      context.read<AzkarCubit>().resetCounter();
                    },
                    icon: Icon(Icons.refresh),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      context.read<AzkarCubit>().addCounter();
                    },
                    icon: Icon(Icons.add),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      context.read<AzkarCubit>().speak(text);
                    },
                    icon: Icon(Icons.hearing),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
