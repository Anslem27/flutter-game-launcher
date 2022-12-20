/* import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeTracker extends StatefulWidget {
  @override
  _TimeTrackerState createState() => _TimeTrackerState();
}

class _TimeTrackerState extends State<TimeTracker> {
  final Box<Map> _timeBox = Hive.box<Map>('time_box');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _timeBox.listenable(),
        builder: (context, Box<Map> timeBox, _) {
          final timeList = timeBox.values.toList();
          int totalTime = 0;
          for (final timeMap in timeList) {
            final startTime = timeMap['start_time'];
            final endTime = timeMap['end_time'];
            final elapsedTime = endTime - startTime;
            totalTime += elapsedTime.inSeconds;
          }
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: timeList.length,
                itemBuilder: (context, index) {
                  final timeMap = timeList[index];
                  final appName = timeMap['app_name'];
                  final startTime = timeMap['start_time'];
                  final endTime = timeMap['end_time'];
                  final elapsedTime = endTime - startTime;

                  return ListTile(
                    title: Text(appName),
                    subtitle: Text(
                        '${timeago.format(startTime)} - ${timeago.format(endTime)}'),
                    trailing: Text('${elapsedTime.inSeconds} seconds'),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total time: $totalTime seconds',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Launch the external app here
          const appName = 'External App';
          final startTime = DateTime.now();
          // Wait for the external app to close
          final endTime = DateTime.now();
          final timeMap = {
            'app_name': appName,
            'start_time': startTime,
            'end_time': endTime,
          };
          _timeBox.add(timeMap);
        },
        child: Icon(Icons.launch),
      ),
    );
  }
}
 */