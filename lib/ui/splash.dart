part of 'ui.dart';
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreen createState() => _SplashScreen();
}
 
class _SplashScreen extends State<SplashScreen>{
 
  void initState(){
    super.initState();
    startSplashScreen();
  }
 
  startSplashScreen () async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return Home();
        })
      );
    });
  }
 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Image.asset('assets/icon/watch.png', height: MediaQuery.of(context).size.height * 0.2,)
      ),
    );
  }
}