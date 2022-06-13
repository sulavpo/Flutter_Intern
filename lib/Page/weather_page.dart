import 'dart:ui';

import 'package:blco_api/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
// import '../http/weather_repo.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double? c;
  WeatherModel? model;
  TextEditingController cityCtrl = TextEditingController();
  callMe() async {
    BlocProvider.of<WeatherBloc>(context)
        .add(FetchWeatherEvent(cityName: cityCtrl.text));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: Image.asset('assets/img/earth.jpg').image,
                          fit: BoxFit.fill))),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(80, 10, 10, 0),
              child: Text(
                'Search Weather',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(145, 2, 10, 5),
              child: Text('Instantly',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 5, 20, 5),
              child: TextFormField(
                controller: cityCtrl,
                decoration: InputDecoration(
                    hintText: 'Cityname',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            BlocListener<WeatherBloc, WeatherState>(
              listener: (context, state) {
                if (state is LoadedWeatherState) {
                  _showDialog(state.model);
                  c = (double.parse(state.model.main!.temp!) - 273.15).roundToDouble();
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 5, 30, 200),
                child: ElevatedButton(
                    onPressed: () {
                      callMe();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Center(
                      child: Text('Search'),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(WeatherModel model) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.blueGrey[900],
              content: SizedBox(
                height: 220,
                width: 270,
                child: Stack(children: [
                  Positioned(
                      top: 10,
                      right: 50,
                      child: Text(
                        'Weather Report',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Positioned(
                      top: 30,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                            child: Icon(
                              Icons.thermostat,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(74, 20, 0, 0),
                            child: Icon(
                              Icons.speed_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(55, 20, 0, 0),
                            child: Icon(
                              Icons.water_drop,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: Text(
                          'Temperature',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(56, 80, 0, 0),
                        child: Text('Pressure',
                            style: TextStyle(color: Colors.white, fontSize: 8)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 80, 0, 0),
                        child: Text('Humidity',
                            style: TextStyle(color: Colors.white, fontSize: 8)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Text(
                          " $c °C",
                          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 100, 0, 0),
                        child: Text(
                          " ${model.main!.pressure}",
                          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 100, 0, 0),
                        child: Text(
                          " ${model.main!.humidity}",
                          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    left: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(50, 10, 50, 10)),
                      ),
                      child: const Center(child: Text("OK")),
                      onPressed: () {
                        //Navigator.pushNamed(context, "/screen1");
                        Navigator.pop(context);
                      },
                    ),
                  )
                ]),
              )
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Align(
              //       alignment: Alignment.topLeft,
              //       child: Text(
              //         "Humidity: ${model.main!.humidity}",
              //       ),
              //     ),
              //     Align(alignment: Alignment.topLeft,child: Text("Pressure:  ${model.main!.pressure} ")),
              //     Align(alignment: Alignment.topLeft,child: Text("Temp_min:  ${model.main!.tempMin}")),
              //     Align(alignment: Alignment.topLeft,child: Text('Temp_max:  ${model.main!.tempMax}')),
              //     Align(alignment: Alignment.topLeft,child: Text('Temp: ${model.main!.temp} ')),
              //     ElevatedButton(
              //       child: const Text("OK"),
              //       onPressed: () {
              //         //Navigator.pushNamed(context, "/screen1");
              //         Navigator.pop(context);
              //       },
              //     )
              //   ],
              // )
              );
        });
  }
}
