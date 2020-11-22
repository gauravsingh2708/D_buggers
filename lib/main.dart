import 'package:d_bugger/Widgets/drawer.dart';
import 'package:d_bugger/route.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechnoFarm',
      initialRoute: '/Location',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String location = '';
  Future<void> getLocation() async{
    SharedPreferences prefs = await SharedPreferences.getInstance().then((prefs){
      setState(() {
        location = prefs.getString('location');
      });
    });

  }
  List<String> category = ['Events', 'News', 'Products', 'Consulting'];
  List<String> img = ['asset/img/potato.jpg','asset/img/rice.jpg','asset/img/tomato.jpg','asset/img/wheat.jpg','asset/img/chickpeas.jpg',];
  List<String> emojis = [Emojis.timerClock,Emojis.newspaper,Emojis.satellite,Emojis.womanConstructionWorkerDarkSkinTone];
  @override
  void initState() {
    getLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              child:Container(
                height: 40,
                width: double.infinity,
                color: Theme.of(context).accentColor,
                child: Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context)
                          .size
                          .width -
                          50,
                      child: Padding(
                        padding:
                        const EdgeInsets.all(5.0),
                        child: Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.1),
                                borderRadius:
                                BorderRadius.circular(
                                    3)),
                            child: Center(
                                child: Text(' Edit '))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 50.0),
                      child: SingleChildScrollView(
                          scrollDirection:
                          Axis.horizontal,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 8.0,
                                bottom: 8),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .center,
                              children: [
                                Icon(Icons.location_on),
                                Text(location,style: TextStyle(color: Colors.white),)

                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/Location',);
              },
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, Simran',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "it's a sunny day!",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
//                          Container(
//                            height: 40,
//                            width: 120,
//                            decoration: BoxDecoration(
//                              color: Colors.transparent,
//                              borderRadius: BorderRadius.circular(20),
//                            ),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: [
//                                Icon(Icons.location_searching),
//                                Text(
//                                  'Dhanbad',
//                                  style: TextStyle(
//                                      fontSize: 15,
//                                      color: Colors.white,
//                                      fontWeight: FontWeight.w500),
//                                )
//                              ],
//                            ),
//                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 130.0, left: 15, right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '62°F',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Temperature',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '61 %     ',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Humidity',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '0.0 mm',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'RainFall',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '3.9 m/s',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'WindSpeed',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 7,bottom: 9),
              child: Text(
                'Category',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(category.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, top: 8, bottom: 8, left: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Center(child: Text(emojis[index],style: TextStyle(fontSize: 60),)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(category[index])
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 7,bottom: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top crop in this area',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Text('See All ->')
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(img.length, (index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 2.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(img[index]),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 7,bottom: 9),
              child: Text(
                'Trending Diseases',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(6, (index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        height: 170,
                        width: MediaQuery.of(context).size.width-80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('')
                    ],
                  );
                }),
              ),
            ),

          ],
        )),
      ),
    );
  }
}
