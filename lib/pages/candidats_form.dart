import 'dart:convert';

import 'package:candidature/common/IButton.dart';
import 'package:candidature/common/IIinput.dart';
import 'package:candidature/models/person.dart';
import 'package:candidature/pages/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class FriendFormPage extends StatefulWidget {
  const FriendFormPage({super.key});

  @override
  State<FriendFormPage> createState() => _FriendFormPageState();
}

class _FriendFormPageState extends State<FriendFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Person person= Person();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              IIinput(
                name: 'Nom',
iinputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                 // print("Valeur à sauvegarder $value");
                  person.name=value;

                },

                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.access_time_filled),
              ),
             SizedBox(height: 10,),
              IIinput(
                name: 'Prenom',
iinputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.surname=value;

                },

                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.access_time_filled),
              ),
              SizedBox(height: 10,),
              IIinput(
                maxiLine: 5,
                name: 'Bibliographie',
iinputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.bibliography=value;

                },

              ),

              SizedBox(height: 10,),
            ],

          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
          if(  _formKey.currentState!.validate()){
            _formKey.currentState!.save();
            sendDataToServer(person);
           Navigator.pop(context, person);
          }
          },
          text: "S'incrire",
        ),
      ),
    );
  }
}
