import 'package:api_integration/user_api_controller.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  final int page;
  const UsersPage({super.key,required this.page});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  String search = "";

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          TextField(
            onChanged: (val){
              setState(() {
                search = val.toUpperCase();
              });
            },
            decoration: InputDecoration(
              hintText: "Serach By Name",
              prefixIcon: Icon(Icons.search_rounded)

            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: UserAPiController().getUserByPage(widget.page),
              builder:(context,snap){
                if(snap.hasData){
                  List<dynamic> userData = snap.data!["data"];
                  userData = userData.where((ele)=> "${ele["first_name"]}${ele["last_name"]}${ele["email"]}".toUpperCase().contains(search)).toList();
                  print(snap.data!["data"].runtimeType);
                  return ListView.builder(
                      itemCount: userData.length,
                      itemBuilder:(context,index){
                        final user = userData[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          user["avatar"]?? ""
                        ),
                      ),
                      title: Text(
                        "${user["first_name"] ?? ""} ${user["last_name"] ?? ""}"
                      ),
                      subtitle: Text("${user["email"] ?? ""}"),
                    );
                  });
                }else if(snap.hasError){
                  return Text("Error while fetching user details");
                }
                return Center(child: CircularProgressIndicator());
            },),
          ),
        ],
      );
  }
}
