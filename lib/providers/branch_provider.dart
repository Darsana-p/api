import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../models/branch.dart';

///post->future class

class branch_provider with ChangeNotifier{
  List<Branch>_branches=[];
  List<Branch>get branches=>_branches;
  Future<void>fetch_branch(
      String tocken
      )async{
    final url="https://flutter-amr.noviindus.in/api/BranchList";
    final response=await http.get(Uri.parse(url),
    headers: {'Authorization':'Bearer $tocken'}
    );
if(response.statusCode==200){
  final Map<String,dynamic>jsondata=json.decode(response.body);
  final List<dynamic>branchesdata=jsondata['branches'];
  _branches=branchesdata.map((branchdata)=>Branch.fromJson(branchdata)).toList();
  notifyListeners();
}else{
  throw Exception("failed to load branches");
}
  }
}