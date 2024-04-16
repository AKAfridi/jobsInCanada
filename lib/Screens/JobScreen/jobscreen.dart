import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jobs_in_canada/Models/alljobs_model.dart';
import 'package:jobs_in_canada/Models/catjobs_model.dart';
import 'package:jobs_in_canada/Models/statejobsmodel.dart';
import 'package:jobs_in_canada/Models/todayjobs_model.dart';
import 'package:jobs_in_canada/Screens/JobScreen/cv_screen.dart';
import 'package:jobs_in_canada/Widgets/row.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class JobScreen<T> extends StatefulWidget {
  final T jobData;

  const JobScreen({super.key, required this.jobData});

  @override
  State<JobScreen<T>> createState() => _JobScreenState<T>();
}

class _JobScreenState<T> extends State<JobScreen<T>> {
  String title = "";

  String salary = "";
  String category = "";
  String state = "";
  String type = "";
  String detail = "";

  String email = "";

  void func() {
    //  this if is for Category Jobs Models
    if (widget.jobData is CatJobsModel) {
      List<String> words1 =
          (widget.jobData as CatJobsModel).title.toString().split(" ");
      List<String> words2 =
          (widget.jobData as CatJobsModel).salary.toString().split(" ");
      List<String> words3 =
          (widget.jobData as CatJobsModel).email.toString().split(" ");

      if (words1.length > 5 || words2.length > 5 || words3.length > 5) {
        title += words1.sublist(0, min(5, words1.length)).join(" ");
        salary += words2.sublist(0, min(5, words2.length)).join(" ");
        email += words3.sublist(0, min(5, words3.length)).join(" ");
      } else {
        title = (widget.jobData as CatJobsModel).title.toString();
        salary = (widget.jobData as CatJobsModel).salary.toString();
        email = (widget.jobData as CatJobsModel).email.toString();
      }
      category = (widget.jobData as CatJobsModel).category.toString();
      state = (widget.jobData as CatJobsModel).state.toString();
      type = (widget.jobData as CatJobsModel).type.toString();
      detail = (widget.jobData as CatJobsModel).detail.toString();
    }

    // this is for today jobs model
    else if (widget.jobData is TodayJobsModel) {
      List<String> words1 =
          (widget.jobData as TodayJobsModel).title.toString().split(" ");
      List<String> words2 =
          (widget.jobData as TodayJobsModel).salary.toString().split(" ");
      List<String> words3 =
          (widget.jobData as TodayJobsModel).email.toString().split(" ");

      if (words1.length > 5 || words2.length > 5 || words3.length > 5) {
        title = words1.sublist(0, min(5, words1.length)).join(" ");
        salary = words2.sublist(0, min(5, words2.length)).join(" ");
        email = words3.sublist(0, min(5, words3.length)).join(" ");
      } else {
        title = (widget.jobData as TodayJobsModel).title.toString();
        salary = (widget.jobData as TodayJobsModel).salary.toString();
        email = (widget.jobData as TodayJobsModel).email.toString();
      }
      category = (widget.jobData as TodayJobsModel).category.toString();
      state = (widget.jobData as TodayJobsModel).state.toString();
      type = (widget.jobData as TodayJobsModel).type.toString();
      detail = (widget.jobData as TodayJobsModel).detail.toString();
    }

    // this is for all jobs model
    else if (widget.jobData is AllJobsModel) {
      List<String> words1 =
          (widget.jobData as AllJobsModel).title.toString().split(" ");
      List<String> words2 =
          (widget.jobData as AllJobsModel).salary.toString().split(" ");
      List<String> words3 =
          (widget.jobData as AllJobsModel).email.toString().split(" ");

      if (words1.length > 5 || words2.length > 5 || words3.length > 5) {
        title += words1.sublist(0, min(5, words1.length)).join(" ");
        salary += words2.sublist(0, min(5, words2.length)).join(" ");
        email += words3.sublist(0, min(5, words3.length)).join(" ");
      } else {
        title = (widget.jobData as AllJobsModel).title.toString();
        salary = (widget.jobData as AllJobsModel).salary.toString();
        email = (widget.jobData as AllJobsModel).email.toString();
      }
      category = (widget.jobData as AllJobsModel).category.toString();
      state = (widget.jobData as AllJobsModel).state.toString();
      type = (widget.jobData as AllJobsModel).type.toString();
      detail = (widget.jobData as AllJobsModel).detail.toString();
    }

    // this is for state jobs model
    else if (widget.jobData is StateJobsModel) {
      List<String> words1 =
          (widget.jobData as StateJobsModel).title.toString().split(" ");
      List<String> words2 =
          (widget.jobData as StateJobsModel).salary.toString().split(" ");
      List<String> words3 =
          (widget.jobData as StateJobsModel).email.toString().split(" ");

      if (words1.length > 5 || words2.length > 5 || words3.length > 5) {
        title += words1.sublist(0, min(5, words1.length)).join(" ");
        salary += words2.sublist(0, min(5, words2.length)).join(" ");
        email += words3.sublist(0, min(5, words3.length)).join(" ");
      } else {
        title = (widget.jobData as StateJobsModel).title.toString();
        salary = (widget.jobData as StateJobsModel).salary.toString();
        email = (widget.jobData as StateJobsModel).email.toString();
      }
      category = (widget.jobData as StateJobsModel).category.toString();
      state = (widget.jobData as StateJobsModel).state.toString();
      type = (widget.jobData as StateJobsModel).type.toString();
      detail = (widget.jobData as StateJobsModel).detail.toString();
    }
    // else if (widget.jobData is CatJobsModel) {
    //   List<String> words1 =
    //       (widget.jobData as CatJobsModel).title.toString().split(" ");
    //   List<String> words2 =
    //       (widget.jobData as CatJobsModel).salary.toString().split(" ");
    //   List<String> words3 =
    //       (widget.jobData as CatJobsModel).email.toString().split(" ");

    //   if (words1.length > 5 || words2.length > 5 || words3.length > 5) {
    //     title += words1.sublist(0, min(5, words1.length)).join(" ");
    //     salary += words2.sublist(0, min(5, words2.length)).join(" ");
    //     email += words3.sublist(0, min(5, words3.length)).join(" ");
    //   } else {
    //     title = (widget.jobData as CatJobsModel).title.toString();
    //     salary = (widget.jobData as CatJobsModel).salary.toString();
    //     email = (widget.jobData as CatJobsModel).email.toString();
    //   }
    //   category = (widget.jobData as CatJobsModel).category.toString();
    //   state = (widget.jobData as CatJobsModel).state.toString();
    //   type = (widget.jobData as CatJobsModel).type.toString();
    //   detail = (widget.jobData as CatJobsModel).detail.toString();
    // }
  }

  @override
  void initState() {
    func();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(children: [
            Card(
              elevation: 10,
              child: Container(
                height: size.height * 0.4,
                width: double.infinity,
                color: const Color(0xff4f0000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RowWidget(icon: Icons.title, title: "Title:- $title"),
                    RowWidget(
                        icon: Icons.category_outlined,
                        title: "Category:- $category"),
                    RowWidget(
                        icon: Icons.attach_money_outlined,
                        title: "Salary:- $salary"),
                    RowWidget(
                        icon: Icons.card_travel_sharp, title: "Type:- $type"),
                    RowWidget(
                        icon: Icons.location_city_rounded,
                        title: "State:- $state"),
                    RowWidget(
                        icon: Icons.mail_outline, title: "Email:- $email"),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cv(
                              title: title,
                            )));
              },
              child: Card(
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: const Color(0xff4f0000),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.fact_check_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "Apply Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Row(
            //     mainAxisSize: MainAxisSize.max,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       InkWell(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => Cv(
            //                         title: title,
            //                       )));
            //         },
            //         child: Card(
            //           child: Container(
            //             height: 60,
            //             width: size.width * .4638,
            //             color: const Color(0xff4f0000),
            //             child: const Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 Icon(
            //                   Icons.fact_check_outlined,
            //                   color: Colors.white,
            //                 ),
            //                 Text(
            //                   "Apply Now",
            //                   style: TextStyle(
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       Card(
            //         child: Container(
            //           height: 60,
            //           width: size.width * .4639,
            //           color: const Color(0xff4f0000),
            //           child: const Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               Icon(
            //                 Icons.favorite_border,
            //                 color: Colors.white,
            //               ),
            //               Text(
            //                 "Add to Favorite",
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ]),
            Card(
              elevation: 10,
              child: Container(
                width: double.infinity,
                color: const Color(0xff4f0000),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "  Details",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      Html(
                        data: detail,
                        style: {"body": Style(color: Colors.white70)},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
