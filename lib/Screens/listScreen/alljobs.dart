import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobs_in_canada/Models/alljobs_model.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_in_canada/Screens/JobScreen/jobscreen.dart';
import 'package:jobs_in_canada/helper/adhelper.dart';

class AllJobsScreen extends StatefulWidget {
  const AllJobsScreen({super.key});

  @override
  State<AllJobsScreen> createState() => _AllJobsScreenState();
}

class _AllJobsScreenState extends State<AllJobsScreen> {
  List<AllJobsModel> getAllJObs = [];

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        'https://gooposts.com/api/vb/ca/cajobsapi.php?check=4&country=1'));
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        getAllJObs.add(AllJobsModel.fromJson(i));
      }
      return getAllJObs;
    } else {
      getAllJObs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Jobs",
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
                    itemCount: getAllJObs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                          child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            JobScreen<AllJobsModel>(
                                              jobData: getAllJObs[index],
                                            )));
                              },
                              title: Text(
                                getAllJObs[index].title.toString(),
                                style: const TextStyle(),
                              ),
                              // subtitle: Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       getAllJObs[index].type.toString(),
                              //       style: const TextStyle(color: Colors.grey),
                              //     ),
                              //     // Text(
                              //     //   getAllJObs[index].email.toString(),
                              //     //   style: const TextStyle(color: Colors.red),
                              //     // ),
                              //   ],
                              // ),
                              trailing:
                                  const Icon(Icons.arrow_forward_ios_outlined)),
                        ),
                      );
                    });
              }
            }),
      ),
      bottomNavigationBar: Adhelper.showNativeBannerAd(),
    );
  }
}
