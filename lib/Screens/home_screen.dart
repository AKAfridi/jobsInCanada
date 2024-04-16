// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jobs_in_canada/Screens/listScreen/alljobs.dart';
import 'package:jobs_in_canada/Screens/categories.dart';
import 'package:jobs_in_canada/Screens/states.dart';
import 'package:jobs_in_canada/Screens/listScreen/todayjobs.dart';
import 'package:jobs_in_canada/helper/adhelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jobs In Canada",
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Image.asset(
        //         "assets/icons/gear.png",
        //         height: 30,
        //         width: 30,
        //       )),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Image.asset(
        //       "assets/icons/heart.png",
        //       height: 30,
        //       width: 30,
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // Card(
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(5),
              //     child: Center(
              //       child: Image.asset(
              //         "assets/images/canada-Unemployment-job.jpeg",
              //         fit: BoxFit.cover,
              //         height: size.height * .22,
              //         width: double.infinity,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Adhelper.showInterstitialAd();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const States()));
                    },
                    child: Card(
                      child: Container(
                        height: 120,
                        width: size.width * 0.42,
                        decoration: BoxDecoration(
                            color: const Color(0xff4f0000),
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/estate.png",
                                    height: 40, width: 40),
                                const Text(
                                  "States Jobs",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Adhelper.showInterstitialAd();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllJobsScreen()));
                    },
                    child: Card(
                      child: Container(
                        height: 120,
                        width: size.width * 0.42,
                        decoration: BoxDecoration(
                            color: const Color(0xff4f0000),
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/job.png",
                                    height: 40, width: 40),
                                const Text(
                                  "Search Jobs",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Adhelper.showInterstitialAd();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesScreen()));
                    },
                    child: Card(
                      child: Container(
                        height: 120,
                        width: size.width * 0.42,
                        decoration: BoxDecoration(
                            color: const Color(0xff4f0000),
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/categories.png",
                                    height: 40, width: 40),
                                const Text(
                                  "Category Jobs",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Adhelper.showInterstitialAd();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TodayJobs()));
                    },
                    child: Card(
                      child: Container(
                        height: 120,
                        width: size.width * 0.42,
                        decoration: BoxDecoration(
                            color: const Color(0xff4f0000),
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/tick.png",
                                    height: 40, width: 40),
                                const Text(
                                  "Today Jobs",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Adhelper.showInterstitialAd();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllJobsScreen()));
                },
                child: Card(
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff4f0000),
                        borderRadius: BorderRadius.circular(5)),
                    child: Stack(children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/internet.png",
                              height: 40,
                              width: 40,
                            ),
                            const Text(
                              "All Jobs",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Adhelper.showNativeBannerAd(),
    );
  }
}
