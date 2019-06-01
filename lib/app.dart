import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_shapes/colors.dart';
import 'package:custom_shapes/login_shape.dart';

class CustomLoginShape extends StatefulWidget {
  @override
  _CustomLoginShapeState createState() => _CustomLoginShapeState();
}

class _CustomLoginShapeState extends State<CustomLoginShape> {
  final _accountCircleWhite =
      ExactAssetImage("assets/account_circle_white_192x192.png");
  Widget _containerChild = Container();

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    final assetBundleImageKey =
        await _accountCircleWhite.obtainKey(ImageConfiguration());
    final codec = await _loadImage(assetBundleImageKey);
    final frameInfo = await codec.getNextFrame();
    setState(() => _containerChild = _main(frameInfo.image));
  }

  Future<ui.Codec> _loadImage(AssetBundleImageKey key) async {
    final ByteData data = await key.bundle.load(key.name);
    if (data == null) throw 'Unable to read data';
    return await ui.instantiateImageCodec(data.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        accentColor: AppColors.black12,
      ),
      home: Scaffold(
        body: Container(
          color: AppColors.lightGrey,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: _containerChild,
            ),
          ),
        ),
      ),
    );
  }

  Widget _main(ui.Image _image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  width: 40.0,
                  height: 40.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'iDon\'t',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'KnowUI',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: CustomPaint(
            child: Container(
              child: _paintChild,
              height: 270,
              width: 400,
            ),
            painter: LoginViewPainter(image: _image),
          ),
        ),
        _signUp,
      ],
    );
  }

  get _paintChild {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _emailField,
        _socialButtonBar,
      ],
    );
  }

  get _emailField {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: TextField(
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
        cursorColor: AppColors.black12,
        decoration: InputDecoration(
          hintText: 'Enter your email',
          hintStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  get _socialButtonBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RawMaterialButton(
          shape: CircleBorder(),
          elevation: 0.0,
          fillColor: Colors.white,
          child: Image.asset(
            'assets/facebook-black-social-button-circle.png',
          ),
          onPressed: () {},
        ),
        RawMaterialButton(
          shape: CircleBorder(),
          fillColor: Colors.white,
          elevation: 0.0,
          child: Image.asset(
            'assets/twitter-logo-button.png',
          ),
          onPressed: () {},
        )
      ],
    );
  }

  get _signUp {
    return Padding(
      padding: EdgeInsets.only(bottom: 48.0),
      child: FlatButton(
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
