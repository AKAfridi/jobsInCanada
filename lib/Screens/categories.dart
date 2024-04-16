import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobs_in_canada/Models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_in_canada/Screens/listScreen/categories_jobs.dart';
import 'package:jobs_in_canada/helper/adhelper.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  List<CategoriesModel> getCategories = [];

  Future fetchData() async {
    final response = await http.get(
        Uri.parse("https://gooposts.com/api/vb/ca/countcat.php?&country=1"));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        getCategories.add(CategoriesModel.fromJson(i));
      }
      return getCategories;
    } else {
      return getCategories;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
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
                    itemCount: getCategories.length,
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
                                        builder: (context) => CategoriesJobs(
                                            getCategories: getCategories[index]
                                                .name
                                                .toString())));
                              },
                              title: Text(
                                getCategories[index].name.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                getCategories[index].count.toString(),
                                style: const TextStyle(color: Colors.white70),
                              ),
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
