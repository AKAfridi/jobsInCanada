import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_in_canada/Models/todayjobs_model.dart';
import 'package:jobs_in_canada/Screens/JobScreen/jobscreen.dart';
import 'package:jobs_in_canada/helper/adhelper.dart';

// ignore: must_be_immutable
class TodayJobs extends StatelessWidget {
  TodayJobs({super.key});
  List<TodayJobsModel> getTodayJobs = [];

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        "https://gooposts.com/api/vb/ca/cajobsapi.php?check=5&country=1"));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        getTodayJobs.add(TodayJobsModel.fromJson(i));
      }
      return getTodayJobs;
    } else {
      return getTodayJobs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today Jobs",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: Colors.amber,
                    color: Colors.blue[900],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return ListView.builder(
                    itemCount: getTodayJobs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            JobScreen<TodayJobsModel>(
                                              jobData: getTodayJobs[index],
                                            )));
                              },

                              title: Text(
                                getTodayJobs[index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text(
                              //   getTodayJobs[index].type.toString(),
                              //   style: const TextStyle(color: Colors.red),
                              // ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ));
                    });
              }
            }),
      ),
      bottomNavigationBar: Adhelper.showNativeBannerAd(),
    );
  }
}
