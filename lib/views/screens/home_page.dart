import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_tenacious/controllers/api_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List button = ['Short By', 'services', 'Great Offers', 'Cuisines'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Food chow"),
        centerTitle: true,
        elevation: 0,
        actions: [
          Icon(CupertinoIcons.viewfinder),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff59BEA6),
      ),
      drawer: Drawer(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 40,
            child: TextFormField(
              cursorColor: Color(0xff59BEA6),
              decoration: const InputDecoration(
                  suffixIconColor: Color(0xff59BEA6),
                  border: OutlineInputBorder(),
                  hintText: "Search Restaurant Name",
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          Card(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: button
                    .map((e) => OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Text(e),
                        ))
                    .toList(),
              ),
            ),
          ),
          FutureBuilder(
              future: APIHelper.apiHelper.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List data = snapshot.data as List;
                  print(
                      "===========================================================");
                  print(data);

                  return Text(data[0]['shop_name']);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })
        ],
      ),
    );
  }
}
