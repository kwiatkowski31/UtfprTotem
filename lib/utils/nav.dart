
import 'package:flutter/material.dart';

Future push( BuildContext context, Widget page ){
	return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
		return page;
	}));
}

Future pushReplacement( BuildContext context, Widget page ) {
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}

void pop( BuildContext context ) { Navigator.pop(context); }

void popOf( BuildContext context ) { Navigator.of(context).pop; }