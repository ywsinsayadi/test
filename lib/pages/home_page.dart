import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radio_ai/models/radio.dart';
import 'package:radio_ai/utils/ai_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<MyRadio>? radios;

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString('assets/radio.json');
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(children: [
        VxAnimatedBox()
            .size(context.screenWidth, context.screenHeight)
            .withGradient(
              LinearGradient(
                colors: [
                  AIColors.primaryColor1,
                  AIColors.primaryColor2,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            )
            .make(),
        AppBar(
          title: "AI Radio".text.xl4.bold.white.make().shimmer(
                primaryColor: Vx.purple300,
                secondaryColor: Colors.white,
              ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ).h(100.0).p16(),
        VxSwiper.builder(
          itemCount: radios!.length,
          aspectRatio: 1.0,
          itemBuilder: (context, index) {
            final rad = radios![index];
            return VxBox(child: ZStack([]))
                .bgImage(
                  DecorationImage(
                    image: NetworkImage(rad.image),
                  ),
                )
                .make();
          },
        )
      ]),
    );
  }
}
