import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../models/treatment.dart';

class treatment_provider with ChangeNotifier{
  List<Treatment>_treatment=[];
  List<Treatment>get treatment =>_treatment;
  Future<void>fetch_treatment(
      String tocken
      )async{
    final url="https://flutter-amr.noviindus.in/api/TreatmentList";
    final response=await http.get(Uri.parse(url),
    headers:{'Authorization':'Bearer $tocken'}
    );
    if(response.statusCode==200){
      final Map<String,dynamic>jsondata=json.decode(response.body);
      final List<dynamic>treatments=jsondata['treatments'];
      _treatment=treatments.map((Treatments)=>Treatment.fromJson(Treatments)).toList();
      notifyListeners();
    }else{
      throw Exception("No new treatements");
    }
  }
}