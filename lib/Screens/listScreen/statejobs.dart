import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_in_canada/Models/statejobsmodel.dart';
import 'package:jobs_in_canada/Screens/JobScreen/jobscreen.dart';
import 'package:jobs_in_canada/helper/adhelper.dart';

// ignore: must_be_immutable
class StateJobs extends StatelessWidget {
  StateJobs({
    super.key,
    required this.getState,
  });
  List<StateJobsModel> getStateJobs = [];
  final String getState;

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        "https://gooposts.com/api/vb/ca/cajobsapi.php?check=3&country=1&state=$getState"));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        getStateJobs.add(StateJobsModel.fromJson(i));
      }
      return getStateJobs;
    } else {
      return getStateJobs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$getState Jobs",
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
                    itemCount: getStateJobs.length,
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
                                            JobScreen<StateJobsModel>(
                                              jobData: getStateJobs[index],
                                            )));
                              },
                              title: Text(
                                getStateJobs[index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text(
                              //   getStateJobs[index].email.toString(),
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
