import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/network/network.dart';
import 'package:weather_forecast/weather_forecast/ui/bottom_view.dart';
import 'package:weather_forecast/weather_forecast/ui/mid_view.dart';

class WeatherForeCast extends StatefulWidget {
  const WeatherForeCast({Key? key}) : super(key: key);

  @override
  State<WeatherForeCast> createState() => _WeatherForeCastState();
}

class _WeatherForeCastState extends State<WeatherForeCast> {
  late Future<WeatherForecastModel> forecastObject;
  late String _cityName = "Mumbai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
    // forecastObject.then((weather) => {
    //   print(weather.list![0].weather![0].main)
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Forecast"),
      // ),
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
                builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    children: [
                      midView(snapshot),
                      bottomView(snapshot, context),
                    ],
                  );
                }
                else
                  {
                    return Container(
                      child: Center( child: CircularProgressIndicator(),),
                    );
                  }

                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
        child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forecastObject = getWeather(cityName: _cityName);
          });

        },
      ),
    )
    );
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      Network().getWeatherForecast(cityName: _cityName);
}
