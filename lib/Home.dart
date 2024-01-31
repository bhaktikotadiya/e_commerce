import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/detailpage.dart';
import 'package:e_commerce/recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
    runApp(MaterialApp(
      routes: {
        "first" : (context) => home(),
        "detail" : (context) => detailpage(),
      },
      initialRoute: "first",
      // home: Myapp(),
      debugShowCheckedModeBanner: false,
    ));
}
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  Future get_data()
  async {
    // var url = Uri.parse('https://api.sampleapis.com/recipes/recipes');
    var url = Uri.https('api.sampleapis.com','recipes/recipes');
    var response = await http.get(url);
    List l = jsonDecode(response.body);
    // print(jsonDecode(response.body));
    // log("l : ${l}");  //developer library
    return l;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("All Recipes Cookbook",style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.deepOrangeAccent.shade200,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            ],
          ),
          body: FutureBuilder(
            future: get_data(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator(),);
              }
              else
              {
                if(snapshot.hasData)
                {
                  dynamic m = snapshot.data;
                  log("list map : ${m}");
                  return ListView.builder(
                    itemCount: m.length,
                    itemBuilder: (context, index) {

                      // print("${jsonEncode(m[index])}"); //Map
                      recipe s = recipe.fromJson(m[index]);
                      // print("s = ${s}");

                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "detail",arguments: s);
                        },
                        child: Container(
                          height: 300,
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: [new BoxShadow(
                                color: Colors.black,
                                offset: Offset(1,3),
                                blurRadius: 8.0,
                              ),],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(opacity: 0.8,fit: BoxFit.fill,image: NetworkImage("${s.photoUrl}"))
                          ),
                          child: Text("${s.title}",maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 25)),
                        ),
                      );

                    },
                  );
                  // return Text("data");
                }
                else
                {
                  return Center(child: CircularProgressIndicator(),);
                }
              }
          },),

        ),
    );
  }
}
