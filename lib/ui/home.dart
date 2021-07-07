part of 'ui.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  bool tombol = false;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image.asset('assets/icon/watch.png', height: MediaQuery.of(context).size.height * 0.3,),
              Text('Stopwatch', style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snapshot) {
                    final value = snapshot.data;
                    final displayTime =
                        StopWatchTimer.getDisplayTime(value, hours: _isHours);
                    return Text(
                      displayTime,
                      style: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  tombol
                      ? IconButton(
                          icon: Icon(
                            Icons.pause,
                            size: 50,
                          ),
                          onPressed: () {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.stop);
                            setState(() {
                              this.tombol = false;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.play_arrow_sharp, size: 50,),
                          onPressed: () {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                            setState(() {
                              this.tombol = true;
                            });
                          }),
                    IconButton(
                          icon: Icon(Icons.stop, size: 50),
                          onPressed: () {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.reset);
                            setState(() {
                              this.tombol = false;
                            });
                          })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
