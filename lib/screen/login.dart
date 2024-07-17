import 'package:api_integration/providers/auth_provider.dart';
import 'package:api_integration/screen/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username=TextEditingController();
  final password=TextEditingController();
  bool isloading=false;

  void login()async{
    setState(() {
      isloading=true;
    });
    try{
      await Provider.of<authprovider>(context,listen: false).login(username.text, password.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>homepage()));
    }catch(e){
      print(e);
    }
    setState(() {
      isloading=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _authprovider=Provider.of<authprovider>(context);
    final userdeatils=_authprovider.user_deatils;
    return Scaffold(
      appBar: AppBar(title: Text("Login here.."),),
      body: Column(
        children: [
          TextField(
            controller: username,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              hintText: 'username',
              prefixIcon: Icon(Icons.person)
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                hintText: 'password',
                prefixIcon: Icon(Icons.visibility_off)
            ),
          ),
          ElevatedButton(onPressed: (){
            login(
            );
          }, child: Text("Login"))
        ],
      ),
    );
  }
}
