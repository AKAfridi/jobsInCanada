import 'dart:convert';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:jobs_in_canada/Models/states_model.dart';
import 'package:jobs_in_canada/Screens/listScreen/statejobs.dart';
import 'package:jobs_in_canada/helper/adhelper.dart';

class States extends StatefulWidget {
  const States({super.key});
  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {
  List<StatesModel> getStates = [];

  Future fetchData() async {
    final response = await http.get(
        Uri.parse("https://gooposts.com/api/vb/ca/castates.php?&country=1"));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        getStates.add(StatesModel.fromJson(i));
      }
      return getStates;
    } else {
      return getStates;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "States",
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
                    color: Colors.blue.shade900,
                    backgroundColor: Colors.amber,
                    strokeWidth: 5,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return ListView.builder(
                    itemCount: getStates.length,
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
                                        builder: (context) => StateJobs(
                                            getState: getStates[index]
                                                .name
                                                .toString())));
                              },
                              title: Text(
                                getStates[index].name.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                getStates[index].count.toString(),
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
