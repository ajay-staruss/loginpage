import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: "Login APP", home: new LoginApp()));
}

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Image(
          image: AssetImage('asset/girl.jpeg'),
          fit: BoxFit.fill,
          colorBlendMode: BlendMode.darken,
          color: Colors.black54,
        ),
        Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.teal, fontSize: 25.0))),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Container(
                padding: EdgeInsets.all(25.0),
                child: Form(
                    child: new Column(
                  children: <Widget>[
                    new TextField(
                      decoration: new InputDecoration(
                          labelText: 'Enter email', fillColor: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextField(
                      decoration: new InputDecoration(
                          labelText: 'Enter Password', fillColor: Colors.white),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 20.0)),
                    MaterialButton(
                      height: 50.0,
                      minWidth: 150.0,
                      color: Colors.teal,
                      splashColor: Colors.red,
                      textColor: Colors.white,
                      child: new Icon(Icons.arrow_forward),
                      onPressed: () => {},
                    )
                  ],
                )),
              )
            ],
          ),
        )
      ],
    ));
  }
}
