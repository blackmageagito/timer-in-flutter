import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StopwatchTimer(),
    );
  }
}

class StopwatchTimer extends StatefulWidget {
  @override
  _StopwatchTimerState createState() => _StopwatchTimerState();
}

class _StopwatchTimerState extends State<StopwatchTimer> {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Updates the UI every 100 milliseconds
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
    });
  }

  // Function to format the elapsed time in hh:mm:ss format
  String _formattedTime() {
    final int milliseconds = _stopwatch.elapsedMilliseconds;
    final int seconds = (milliseconds ~/ 1000) % 60;
    final int minutes = (milliseconds ~/ 60000) % 60;
    final int hours = (milliseconds ~/ 3600000);

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stopwatch Timer',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'shingo',
            shadows: <Shadow>[
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 4.0,
        color: Color.fromARGB(255, 2, 135, 197),
      ),],

          ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Elapsed Time: ${_formattedTime()}',
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'shingo'
                ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? _stopStopwatch : _startStopwatch,
                  child: Text(_stopwatch.isRunning ? 'Stop' : 'Start',
                  style: const TextStyle(
                      fontFamily: 'shingo',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.greenAccent
                    ),
                  ),
                ),
                const SizedBox(width: 20),  
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontFamily: 'shingo',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.redAccent
                    ),
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
