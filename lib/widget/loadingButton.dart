import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final LoadingButtonController controller;

  final VoidCallback onPressed;

  LoadingButton({Key key, this.controller, this.onPressed});

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  ButtonStatus _buttonStatus = ButtonStatus.none;

  _buildChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '登录',
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.lightBlueAccent,
          ),
        ],
      );
    } else if (_buttonStatus == ButtonStatus.loading) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white60),
        backgroundColor: Colors.lightBlueAccent,
        strokeWidth: 2,
      );
    } else if (_buttonStatus == ButtonStatus.done) {
      return Icon(
        Icons.check,
        color: Colors.lightBlueAccent,
      );
    }
  }

  _btnOnPressed() {
    setState(() {
      _buttonStatus = ButtonStatus.loading;
    });
    _start();
    widget.onPressed();
  }

  @override
  void initState() {
    super.initState();
    _buttonStatus = ButtonStatus.none;
    widget.controller?._addListeners(_start, _stop, _success, _error, _reset);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(200, 65)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      ),
      //color: Colors.lightBlueAccent,

      onPressed: _btnOnPressed,
      child: _buildChild(),
    );
  }
  _stop() {
    print("Stop!");
  }

  _start() {
    print("Start!");
  }

  _success() {
    setState(() {
      _buttonStatus = ButtonStatus.done;
    });
    print("Success!");
  }

  _error() {
    print("Error!");
  }

  _reset() {
    print("Reset!");
  }
}

enum ButtonStatus { none, loading, done }

class LoadingButtonController {
  VoidCallback _startListener;
  VoidCallback _stopListener;
  VoidCallback _successListener;
  VoidCallback _errorListener;
  VoidCallback _resetListener;

  _addListeners(
      VoidCallback startListener,
      VoidCallback stopListener,
      VoidCallback successListener,
      VoidCallback errorListener,
      VoidCallback resetListener) {
    this._startListener = startListener;
    this._stopListener = stopListener;
    this._successListener = successListener;
    this._errorListener = errorListener;
    this._resetListener = resetListener;
  }

  start() {
    _startListener();
  }

  stop() {
    _stopListener();
  }

  success() {
    _successListener();
  }

  error() {
    _errorListener();
  }

  reset() {
    _resetListener();
  }
}
