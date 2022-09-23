import 'package:flutter/material.dart';

import '../bottom_nav_bar/bottom_bar_view.dart';
import '../login/login_view.dart';
import 'model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = BoardingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(
              "assets/images/Logo Color.png",
              height: 65,
              width: 160,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: size.height * 0.65,
            child: PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                controller.currentPage = value;
                setState(() {});
              },
              children: List.generate(
                  controller.model.length,
                  (index) => SingleChildScrollView(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Image.asset(
                                controller.model[controller.currentPage].image,
                                height: size.height * 0.45,
                                width: size.width,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                controller.model[controller.currentPage].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                controller
                                    .model[controller.currentPage].subtitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          controller.currentPage == controller.model.length - 1
              ? TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "let's go!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff24D4A4), fontSize: 20),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavBarScreen()));
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            controller.model.length,
                            (index) => Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 5),
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Color(
                                        index == controller.currentPage
                                            ?0xff24D4A4
                                            : 0xffB6ECDD),
                                  ),
                                )),
                      ),
                      TextButton(
                          onPressed: () {
                            if (controller.currentPage <
                                (controller.model.length - 1)) {
                              controller.currentPage++;
                              setState(() {});
                            }
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Color(0xff24D4A4), fontSize: 20),
                          )),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
