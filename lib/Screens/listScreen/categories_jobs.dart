import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_in_canada/Models/catjobs_model.dart';
import 'package:jobs_in_canada/Screens/JobScreen/jobscreen.dart';
import 'package:jobs_in_canada/helper/adhelper.dart';

class CategoriesJobs extends StatefulWidget {
  const CategoriesJobs({
    super.key,
    required this.getCategories,
  });

  final String getCategories;

  @override
  State<CategoriesJobs> createState() => _CategoriesJobsState();
}

class _CategoriesJobsState extends State<CategoriesJobs> {
  List<CatJobsModel> getCatJobs = [];

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        "https://gooposts.com/api/vb/ca/cajobsapi.php?check=1&country=1&category=${widget.getCategories}"));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        getCatJobs.add(CatJobsModel.fromJson(i));
      }
      return getCatJobs;
    } else {
      return getCatJobs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.getCategories} Jobs",
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
                    itemCount: getCatJobs.length,
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
                                            JobScreen<CatJobsModel>(
                                              jobData: getCatJobs[index],
                                            )));
                              },
                              title: Text(
                                getCatJobs[index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text(
                              //   getCatJobs[index].email.toString(),
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
