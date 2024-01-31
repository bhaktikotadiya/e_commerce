import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/recipe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class detailpage extends StatefulWidget {
  const detailpage({super.key});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {

  bool t = false;
  List new_add = [];

  @override
  Widget build(BuildContext context) {

    //navigator.pushnamed in return s(class datatype) for product datatype of p
    recipe r = ModalRoute.of(context)!.settings.arguments as recipe;

    Future getdata()
    async {
      var url = Uri.parse('https://api.sampleapis.com/recipes/recipes/${r.id}');
      // var url = Uri.https('domain name','last name');
      var response = await http.get(url);
      Map m = jsonDecode(response.body);
      log("${m}");  //developer library
      return m;
    }

    List color = [
      Colors.green,Colors.yellow.shade400,Colors.pink,Colors.deepPurple.shade600,Colors.brown,Colors.deepPurpleAccent,
      Colors.grey,Colors.indigoAccent,Colors.orange.shade200,Colors.brown.shade200,Colors.lightGreenAccent.shade200,Colors.amber,
      Colors.green,
    ];

    List icon = [
      Icons.fiber_dvr,
      Icons.local_fire_department_outlined,
      Icons.emoji_food_beverage,
      Icons.food_bank_outlined,
      Icons.fastfood_rounded,
      Icons.food_bank_sharp,
      Icons.no_food,
      Icons.food_bank_outlined,
      Icons.food_bank_sharp,
      Icons.local_fire_department_outlined,
      Icons.emoji_food_beverage_rounded,
    ];

    List icon_data = [
      "${r.calories}","${r.fat}","${r.cholesterol}","${r.sodium}","${r.sugar}","${r.carbohydrate}",
      "${r.fiber}","${r.protein}","${r.servings}","${r.yield}","${r.nutritionalScoreGeneric}",
    ];

    List l = [
      "calories","fat","cholesterol","sodium","sugar","carbohydrate",
      "fiber","protein","servings","yield","nutritionalScoreGeneric",
    ];

    return SafeArea(child:
      Scaffold(
        appBar: AppBar(
          title: Text("${r.title}",style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepOrangeAccent.shade200,
        ),
        body: Column(children: [
          Expanded(flex: 4,child:
              Container(
                height: double.infinity,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [new BoxShadow(
                      color: Colors.black,
                      offset: Offset(1,3),
                      blurRadius: 8.0,
                    ),],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(fit: BoxFit.fill,image: NetworkImage("${r.photoUrl}"))
                ),
              )
          ),
          Expanded(flex: 6,child:
            Container(
              height: double.infinity,
              margin: EdgeInsets.all(10),
              // color: Colors.red,
              child: Column(children: [
                //Text("${r.title}",style: TextStyle(color: Colors.white,fontSize: 20),)
                Expanded(
                  child: Row(children: [
                    Expanded(flex: 4,
                      child: Container(
                        child: Text("${r.title}",style: TextStyle(color: Colors.black,fontSize: 25),),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: (t)?
                          IconButton(onPressed: () {
                            t=false;
                            new_add.remove(r.id);
                            setState(() { });
                          }, icon: Icon(Icons.favorite_border,color: Colors.white,size: 35,)):
                          IconButton(onPressed: () {
                            t=true;
                            new_add.add(r.id);
                            setState(() { });
                          }, icon: Icon(Icons.favorite,color: Colors.white,size: 35,)),
                      ),
                    )
                  ],)
                ),
                Expanded(flex: 1,
                  child: Container(
                    height: double.infinity,
                    // color: Colors.limeAccent,
                    child: ListView.builder(
                      itemCount: l.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(children: [
                            Container(
                            height: 50,width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: color[index],shape: BoxShape.circle),
                            margin: EdgeInsets.all(5),
                            child: Icon(icon[index]),
                          ),
                          Text("\t${icon_data[index]}"),
                          Text("\t${l[index]}"),
                        ],);
                    },),
                  ),
                ),
                Expanded(flex: 1,
                  child: Row(children: [
                    Expanded(flex: 4,
                      child: Container(
                        height: 70,
                        color: Colors.deepOrangeAccent.shade200,
                        child: Row(children: [
                          IconButton(onPressed: (){
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                title: Text("MAIN INCLUDE INGREDIENTS",style: TextStyle(color: Colors.deepOrangeAccent.shade200)),
                                content: Text("\n${r.ingredients}",overflow: TextOverflow.visible,softWrap: true,),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("OK"))
                                ],
                              );
                            },);
                          }, icon: Icon(Icons.list_sharp,color: Colors.white,size: 30,)),
                          Text("INGREDIENTS REQUIRED",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ],)
                      ),
                    ),
                    Expanded(flex: 1,
                      child: Container(
                        height: 70,
                        alignment: Alignment.center,
                        child: Text("3 items",maxLines: 1,style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent.shade200,)),
                      ),
                    )
                  ],),
                ),
                Expanded(flex: 2,
                  child: Container(
                    height: 300,
                    // color: Colors.limeAccent,
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                        child: Text("--> ${r.directions}",style: TextStyle(fontSize: 20))
                    ),
                  ),
                ),
              ]),
            )
          ),
        ]),
      )
    );
  }
}
