import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class game2Provider with ChangeNotifier{

  Timer? _timer;

  int _left=0;
  int _top=0;

  int get left=>_left;
  int get top=>_top;




  void setNewLocation(BuildContext context){
    int x=0, y=20;
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;


  this._top+=12;
  this._left++;
x=this._left;
y=this._top;
    print("Screen W: "+this._left.toString()+" H:"+ this._top.toString());

     this._left = x>screenWidth?this._left=0:x;
    this._top =  y>screenHeight?this._top=0:y;

    showHide(context);
    notifyListeners();
  }
void showHide(BuildContext context){
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: 10),(){
      setNewLocation(context);
    });

  }

  void restart(){
    _left=0;
    _top=0;
    _timer?.cancel();
    notifyListeners();

  }

}