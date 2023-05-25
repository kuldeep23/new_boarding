import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

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
                  color: Colors.teal.shade700,
                  fontSize: 32,
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = (index == 2);
            });
          },
          children: [
            buildPage(
                color: Colors.green.shade100,
                urlImage:
                    'https://assets8.lottiefiles.com/packages/lf20_kzvh3s9g.json',
                title: 'REDUCE',
                subtitle:
                    'It is for the information of the Board that there is requirement of the LED Strips Grow Light for beautification of different places in Cantt area'),
            buildPage(
                color: Colors.red.shade100,
                urlImage:
                    'https://assets10.lottiefiles.com/packages/lf20_jmejybvu.json',
                title: 'REDUCE',
                subtitle:
                    'It is for the information of the Board that there is requirement of the LED Strips Grow Light for beautification of different places in Cantt area'),
            buildPage(
                color: Colors.deepOrange.shade100,
                urlImage:
                    'https://assets6.lottiefiles.com/packages/lf20_5e7wgehs.json',
                title: 'REDUCE',
                subtitle:
                    'It is for the information of the Board that there is requirement of the LED Strips Grow Light for beautification of different places in Cantt area'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1)),
                  primary: Colors.white,
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: Size.fromHeight(90)),
              onPressed: () async {
                /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));*/
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
                        controller.jumpToPage(2);
                      },
                      child: const Text(
                        'SKIP',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
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
                      child: const Text('NEXT',
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              ),
            ),
    );
  }
}
