import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BooksApi extends StatefulWidget {
  const BooksApi({super.key});

  @override
  State<BooksApi> createState() => _BooksApiState();
}

class _BooksApiState extends State<BooksApi> {

  List<dynamic> booksData=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books ${booksData.length}"),
      ),
      body: FutureBuilder(
        future: getBooks(),
        builder:(context,snap){
        if(snap.hasData){
          return ListView.builder(
              itemCount: booksData.length,
              itemBuilder:(context,index){
                final book = booksData[index];
                return ListTile(
                  title: Text(book["title"] ?? ""),
                  subtitle: Text(book["author"] ?? ""),
                  trailing: Text("${book["yearPublished"] ?? ""}"),
                  leading: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffffbb00),
                    ),
                    child: Center(child: Text(book["title"][0])),
                  ),
                );
          });
        }
        return Center(child: CircularProgressIndicator());
      },),
    );
  }

  Future<List<dynamic>> getBooks() async{
    Dio dio =Dio();
    final url="https://library-api.postmanlabs.com/books";
    try{
      final res = await dio.get(url);
      if(res.statusCode==200){
        print(res.data);
        setState(() {
          booksData = res.data;
        });
        return res.data;
      }
      return [];
    }catch(err){
      return [];
    }
  }
}
