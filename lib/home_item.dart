import 'package:azkar/cubit/cubit/azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    //  int counter = 0;

    // print("ppppppp");
    return BlocProvider(
      create: (context) => AzkarCubit(),
      child: Column(
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
              BlocBuilder<AzkarCubit, AzkarState>(
                builder: (context, state) {
                  return IconButton(
                    iconSize: 50,
                    onPressed: () {
                      context.read<AzkarCubit>().resetCounter();
                      // setState(() {
                      //   counter = 0;
                      // });
                    },
                    icon: Icon(Icons.refresh),
                  );
                },
              ),
              BlocBuilder<AzkarCubit, AzkarState>(
                builder: (context, state) {
                  return IconButton(
                    iconSize: 50,
                    onPressed: () {
                      // print(state.counter);

                      context.read<AzkarCubit>().addCounter();
                      // print(state.counter);

                      // setState(() {
                      //   counter++;
                      // });
                    },
                    icon: Icon(Icons.add),
                  );
                },
              ),
              BlocBuilder<AzkarCubit, AzkarState>(
                builder: (context, state) {
                  return IconButton(
                    iconSize: 50,
                    onPressed: () {
                      context.read<AzkarCubit>().speak(text);
                      // setState(() {
                      //   speak(widget.text);
                      // });
                    },
                    icon: Icon(Icons.hearing),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

//set state 

// 0 1 2 3 