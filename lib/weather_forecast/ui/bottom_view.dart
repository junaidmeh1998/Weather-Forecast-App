import 'package:flutter/material.dart';

import '../model/weather_forecast_model.dart';
import 'forecast_card.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data?.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "7-Day Weather Forecast".toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
                  width: 8,
                ),
            itemCount: forecastList!.length,
            itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 160,
                    child: forecastCard(snapshot, index),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff9661C3), Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  ),
                )),
      )
    ],
  );
}
