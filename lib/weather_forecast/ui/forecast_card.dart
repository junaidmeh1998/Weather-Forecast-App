import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';

import '../model/weather_forecast_model.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  // DateTime date =
  //     new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);

  var fullDate = Util.getFormattedDate(
      DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000));
  dayOfWeek = fullDate.split(",")[0];
  //fullDate.split(",")[0];//fullDate.split(",")[0];
  // var dayString = getDayString(date.weekday);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
          child: Padding(padding: EdgeInsets.all(8.0), child: Text(dayOfWeek))),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
                weatherDescription: forecastList[index].weather![0].main,
                color: Colors.pinkAccent,
                size: 45),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                          "${forecastList[index].main?.tempMin?.toStringAsFixed(0)} °F")),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 17,
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "${forecastList[index].main?.tempMax?.toStringAsFixed(0)} °F"),
                      Icon(
                        FontAwesomeIcons.solidArrowAltCircleUp,
                        color: Colors.white,
                        size: 17,
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "Hum:${forecastList[index].main?.humidity?.toStringAsFixed(0)} %"),
                      // Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
                      //   size: 17,)
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "Win:${forecastList[index].wind?.speed?.toStringAsFixed(0)} mi/h "),
                      // Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
                      //   size: 17,)
                    ],
                  ))
            ],
          )
        ],
      )
    ],
  );
}
