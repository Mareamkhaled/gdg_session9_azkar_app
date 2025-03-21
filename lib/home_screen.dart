import 'package:azkar/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    return Scaffold(
      // backgroundColor: LinearGradient(colors: colors),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter,
          colors: [Color(0xff99BFFB), Color(0xffC9FADB)],
        )),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  // controller: controller,
                  children: [
                    HomeItem(text: "سبحان الله و بحمده"),
                    HomeItem(text: "سبحان الله العظيم"),
                    HomeItem(text: "الله اكبر"),
                    HomeItem(text: "لا اله الا الله")
                  ],
                ),
              ),
              SmoothPageIndicator(
                effect: WormEffect(
                    activeDotColor: Colors.black, dotColor: Colors.white),
                controller: controller,
                count: 4,
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// liner gradient

// page view
