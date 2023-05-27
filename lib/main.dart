import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: OverflowBox(
                minHeight: 300,
                maxHeight: 300,
                child: Lottie.network(urlImage),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(title,
                style: TextStyle(
                  color: Colors.deepOrange.shade400,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                subtitle,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = (index == 5);
            });
          },
          children: [
            buildPage(
                color: Colors.green.shade200,
                urlImage:
                    'https://assets1.lottiefiles.com/packages/lf20_pzk9h5cf.json',
                title: 'VISITORS MANAGEMENT',
                subtitle:
                    'Simple tracking of visitors, cabs, and even deliveries! Regardless of whether you are a member of society or not, it is a one-stop shop for all of your guest management needs.'),
            buildPage(
                color: Colors.red.shade100,
                urlImage:
                    'https://assets5.lottiefiles.com/packages/lf20_KU3FGB47d6.json',
                title: 'STAFF MANAGEMENT',
                subtitle:
                    'Receive an alert as soon as one of your staff enters the society\'s facilities. The best-rated domestic help should be chosen for your home, and you should keep track of their attendance digitally.'),
            buildPage(
                color: Colors.blue.shade200,
                urlImage:
                    'https://assets9.lottiefiles.com/packages/lf20_BJ9mFCqhen.json',
                title: 'COMMUNICATION',
                subtitle:
                    'Notices, announcements, and alerts. Everything is here! Know everything there is to know about society.'),
            buildPage(
                color: Colors.teal.shade200,
                urlImage:
                    'https://assets10.lottiefiles.com/packages/lf20_vw3zs7wow6.json',
                title: 'COMPLAINT MANAGEMENT',
                subtitle:
                    'Get quick resolution to your complaints! You only need to file a complaint in this place. You can monitor the status of your complaint at any moment, and the committee members will be immediately notified.'),
            buildPage(
                color: Colors.deepOrange.shade100,
                urlImage:
                    'https://assets4.lottiefiles.com/packages/lf20_uMjybUoeGN.json',
                title: 'AMENITIES BOOKING',
                subtitle:
                    'It is for the information of the Board that there is requirement of the LED Strips Grow Light for beautification of different places in Cantt area'),
            buildPage(
                color: Colors.yellow.shade200,
                urlImage:
                    'https://assets10.lottiefiles.com/packages/lf20_qmfs6c3i.json',
                title: 'NOTICES',
                subtitle:
                    'You must be aware of what is going on in your culture. Visit the digital notice board to learn more. Find everything here, including society meetings and updates.'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1)),
                  primary: Colors.white,
                  backgroundColor: Colors.deepOrange.shade400,
                  minimumSize: Size.fromHeight(80)),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24),
              ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.00),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(5);
                      },
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange.shade400),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 6,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.deepOrange.shade400,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                      },
                      child: Text('NEXT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange.shade400)))
                ],
              ),
            ),
    );
  }
}
