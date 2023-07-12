import 'package:flutter/foundation.dart';
import 'package:weather/weather.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum AppState { notDownloded, downloading, finishedDownloding }

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String key = '856822fd8e22db5e1ba48c0e7d69844a';
  late WeatherFactory ws;
  List<Weather> data = [];
  AppState state = AppState.notDownloded;
  double? lat, lon;

  @override
  void initState() {
    ws = WeatherFactory(key);
    super.initState();
  }

  void queryForecast() async {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      state = AppState.downloading;
    });

    List<Weather> forecasts = await ws.fiveDayForecastByLocation(lat!, lon!);
    setState(() {
      data = forecasts;
      state = AppState.finishedDownloding;
    });
  }

  void queryWeather() async {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
     state=AppState.downloading;
    });

    Weather weather = await ws.currentWeatherByLocation(lat!, lon!);
    setState(() {
      data=[weather];
      state=AppState.finishedDownloding;
    });
  }
  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].toString()),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }

  Widget contentDownloading() {
    return Container(
      margin: const EdgeInsets.all(25),
      child: Column(
        children: [
        const Text(
          'Fetching Weather...',
          style: TextStyle(fontSize: 20),
        ),
        Container(
            margin: const EdgeInsets.only(top: 50),
            child:
                const Center(child: CircularProgressIndicator(strokeWidth: 10)))
      ]),
    );
  }

  Widget contentNotDownloaded() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Press The button for weather forecast'
          ),
        ],
      ),
    );
  }

  Widget _resultView() => state == AppState.finishedDownloding
      ? contentFinishedDownload()
      : state == AppState.downloading
          ? contentDownloading()
          : contentNotDownloaded();

  void _saveLat(String input) {
    lat = double.tryParse(input);
    if (kDebugMode) {
      print(lat);
    }
  }

  void _saveLon(String input) {
    lon = double.tryParse(input);
    if (kDebugMode) {
      print(lon);
    }
  }

  Widget _coordinateInputs() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              margin: const EdgeInsets.all(5),
              child: TextField(
              decoration: const InputDecoration(
              border: OutlineInputBorder(), 
              hintText: 'Enter latitude'),
                keyboardType: TextInputType.phone,
                  onChanged: _saveLat,
                  onSubmitted: _saveLat)),
        ),
             Expanded(
             child: Container(
             margin: const EdgeInsets.all(5),
             child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter longitude'),
                    keyboardType: TextInputType.number,
                    onChanged: _saveLon,
                    onSubmitted: _saveLon)))
      ],
    );
  }
  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin:  const EdgeInsets.all(5),
          child: TextButton(
            onPressed: queryWeather,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child:  const Text(
              'Fetch weather',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextButton(
            onPressed: queryForecast,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
                 child: const Text(
                'Fetch forecast',
                 style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Example App'),
        ),
        body: Column(
          children: <Widget>[
            _coordinateInputs(),
            _buttons(),
            const Text(
              'Output:',
              style: TextStyle(fontSize: 20),
            ),
            const Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            Expanded(child: _resultView())
          ],
        ),
      ),
    );
  }
}
