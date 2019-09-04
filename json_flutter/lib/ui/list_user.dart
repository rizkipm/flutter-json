import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:json_flutter/model/user_model.dart';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {

  //mmebuat list untuk menampung data user
  List<UserModel> listUserModel = [];

  var loading = false;

  //proses get data on background
  Future<Null> getData() async{

    setState(() {
      loading = true; //ketika proses get data set loading nya true
    });

    final responseData = await http.get("https://jsonplaceholder.typicode.com/users");
    //cek status response
    if(responseData.statusCode ==200){
      final data = jsonDecode(responseData.body);
      setState(() {
        for (Map i in data){
          //menambahkan data yang sudah berhasil di get ke list model
          listUserModel.add(UserModel.fromJson(i));
        }

        //proses get data berhasil , loading di set false
        loading = false;
      });
    }
  }

  //load data
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User'),
        backgroundColor: Colors.red,
      ),

      body: Container(
        child: loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: listUserModel.length,
          itemBuilder: (context, index){
            final nDataList = listUserModel[index];
            return Card(
              margin: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nDataList.name, style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16.0, color: Colors.red
                  ),),

                  Text(nDataList.email),
                  Text(nDataList.phone),
                  Text(nDataList.website),
                  SizedBox(height: 10.0,),
                  Text("Address", style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16.0, color: Colors.red
                  ),),
                  Text(nDataList.address.street),
                  Text(nDataList.address.city),
                  Text(nDataList.address.zipcode),
                  SizedBox(height: 10.0,),
                  Text("Company", style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16.0, color: Colors.red
                  ),),
                  Text(nDataList.company.name)
                ],
              ),
            );
          },
        ),) ,

    );
  }
}
