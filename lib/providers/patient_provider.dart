import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import '../models/patient.dart';

///decode the datas


class patient_provider with ChangeNotifier{
  List<Patient>_patients=[];

  List<Patient>get patients{
    return [... _patients];
  }
  Future<void>fetchPatients(String tocken)async{
    final url="https://flutter-amr.noviindus.in/api/PatientList";
    try{
      final response=await http.get(Uri.parse(url),
      headers: {
        'Authorization':'Bearer $tocken',
      },
      );
      if(response.statusCode==200){
        final data=json.decode(response.body)as List;
        _patients = data.map((item)=>Patient.fromJson(item)).toList();
        notifyListeners();
      }else{
        throw Exception('Failed to load patients');
      }
    }catch(error){
      throw error;
    }
  }
}

///here patient_updation so encode
///direct call

class PatientProvider with ChangeNotifier{
  Future<void> registerPatient({
    required String tocken,
    required String name,
    required String executive,
    required String payment,
    required String phone,
    required String address,
    required double totalAmount,
    required double discountAmount,
    required double advanceAmount,
    required double balanceAmount,
    required String dateTime,
    required int id,
    required List<int>maleTreatments,
    required List<int>femaleTreatments,
    required int branch,
    required List<int>treatments,
})async{
    const url ="https://flutter-amr.noviindus.in/api/PatientUpdate";
    try{
      final response=await http.post(Uri.parse(url),
      headers: {
        'Authorization':'Bearer $tocken',
        'content-type':'application/json',
        ///content_type is given postman headers (patientupdate)
      },
      body: json.encode({
        'name':name,
        'executive':executive,
        'payment': payment,
        'address':address,
        'total_amount':totalAmount,
        'discountAmount':discountAmount,
        'advanceAmount':advanceAmount,
        'balanceAmount':balanceAmount,
        'date_and_time':dateTime,
        'id':id,
        'male':maleTreatments.join(','),
        'female':femaleTreatments.join(','),
        'branch':branch,
        'treatments':treatments.join(','),
      }),
      );
      if(response.statusCode!=200){
        throw Exception('Failed to register patient');
      }
    }catch(error){
      throw error;
    }
  }

}