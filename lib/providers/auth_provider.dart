import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

///post method-login

class authprovider with ChangeNotifier{
  String tocken ="";
  Map<String,dynamic> user_deatils={};
  String get Tocken =>tocken;
void settocken (String tocken){
  tocken=tocken;
  notifyListeners();
}
Map<String,dynamic>get userdeatils=>user_deatils;

Future <void> login (String username, String password)async {
  const url="https://flutter-amr.noviindus.in/api/Login";
  final response=await http.post(Uri.parse (url),
    body: {"username":username,"password":password}
  );
  if(response.statusCode==200){
    final responsedata=json.decode(response.body);
    tocken=responsedata['token'];
    user_deatils=responsedata['user_details'];
    notifyListeners();
  }else{
    throw Exception("failed");
  }
}
}