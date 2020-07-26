import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyTest(),
    );
  }
}

class MyTest extends StatefulWidget {
  MyTest({Key key}) : super(key: key);

  @override
  _MyTestSatate createState() => _MyTestSatate();

}

class _MyTestSatate extends State<MyTest>{

  bool _numberInputIsValid = true;

  String hihi = "";

  void _hihi(){
    setState(() {

      hihi = 'hello~';
    });
  }

  Widget _buildNumberTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headline4,
      decoration: InputDecoration(
        //icon: Icon(Icons.attach_money),
        labelText: 'Enter an integer',
        errorText: _numberInputIsValid ? null : 'Please enter an integer!',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onSubmitted: (val) =>
          Fluttertoast.showToast(
            msg: 'aaaaYou entered: ${int.parse(val)}'
            ),
      onChanged: (String val) {
        final v = int.tryParse(val);
        debugPrint('parsed value = $v');
        if (v == null) {
          setState(() => _numberInputIsValid = false);
        } else {
          setState(() => _numberInputIsValid = true);
        }
      },
    );
  }

  Widget _buildBorderlessTextField() {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration.collapsed(hintText: 'borderless input'),
    );
  }


  @override
  Widget build(BuildContext context) {
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
      Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
    ];
    final _kTabPages = <Widget>[
      _buildBorderlessTextField(),
      Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      //Center(child: Text('$hihi')),
      //_buildNumberTextField(),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('테스트앱'),
          backgroundColor: Colors.cyan,
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _hihi,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

