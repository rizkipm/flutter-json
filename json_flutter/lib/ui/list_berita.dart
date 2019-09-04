import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:json_flutter/model/model_berita.dart';

class PageListBerita extends StatefulWidget {
  @override
  _PageListBeritaState createState() => _PageListBeritaState();
}

class _PageListBeritaState extends State<PageListBerita> {

  //mmebuat list untuk menampung data user
  List<ModelBerita> listBerita = [];

  var loading = false;

  //proses get data on background
  Future<Null> getData() async{

    setState(() {
      loading = true; //ketika proses get data set loading nya true
    });

    final responseData = await http.get("http://172.20.10.6/apps_atambua/get_berita.php");
    //cek status response
    if(responseData.statusCode ==200){
      final data = jsonDecode(responseData.body);
      setState(() {
        for (Map i in data){
          //menambahkan data yang sudah berhasil di get ke list model
          listBerita.add(ModelBerita.fromJson(i));
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
          itemCount: listBerita.length,
          itemBuilder: (context, index){
            final nDataList = listBerita[index];
            return Card(
              margin: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nDataList.judulBerita, style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16.0, color: Colors.red
                  ),),

                  Image.network("http://172.20.10.6/apps_atambua/gambar/${nDataList.gambarBerita}"),

                  Text(nDataList.tglBerita)
                ],
              ),
            );
          },
        ),) ,

    );
  }
}
