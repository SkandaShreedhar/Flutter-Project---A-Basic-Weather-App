import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
          title: Text("Weather App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: apicall(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Container(
                            width: 490,
                            color: Colors.lightBlueAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(' ${snapshot.data['name'].toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.cloud,
                                  color: Colors.white70,
                                  size: 97,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${snapshot.data['temp'].toString()}°',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 95,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(snapshot.data['main'].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.lightBlueAccent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('H : ${snapshot.data['high'].toString()}°',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('L : ${snapshot.data['low'].toString()}°',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  color: Colors.lightBlue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Humidity',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Pressure',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.lightBlue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data['humidity'].toString()}%',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data['pressure'].toString()}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.blueAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Feels like',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Wind speed',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.blueAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data['feels_like'].toString()}°',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data['speed'].toString()}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                                Container(
                                  color: Colors.indigoAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Country',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Visibility',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.indigoAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data['country'].toString()}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${snapshot.data['visibility'].toString()}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                      );
                    }
                    else {
                      return CircularProgressIndicator();
                    }
                  }
              )
            ],
          ),
        )
    );
  }

  Future apicall() async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=bangalore&appid=11542823490b7fbc3699f1079ca374e0&units=metric");
    final response = await http.get(url);
    print(response.body);
    final json = jsonDecode(response.body);
    print(json['weather'][0]['description']);
    final output = {
      'temp': json['main']['temp'],
      'feels_like': json['main']['feels_like'],
      'low': json['main']['temp_min'],
      'high': json['main']['temp_max'],
      'icon' : json['weather'][0]['icon'],
      'main': json['weather'][0]['main'],
      'humidity' : json['main']['humidity'],
      'pressure' : json['main']['pressure'],
      'speed' : json['wind']['speed'],
      'id' : json['sys']['id'],
      'country' : json['sys']['country'],
      'sunrise' : json['sys']['sunrise'],
      'sunset' : json['sys']['sunset'],
      'name' : json['name'],
      'visibility' : json['visibility']
    };
    return output;
  }
}














