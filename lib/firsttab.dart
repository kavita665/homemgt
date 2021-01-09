import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder( itemCount: 20, itemBuilder: (BuildContext context,index){
        return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage:  NetworkImage("https://picsum.photos/20$index/300.jpg"),
        
              
            ),
            title: Text("data"),
            subtitle: Text("data"),
            trailing: Text("data"),
          );
          
      },
        
      ),
    );
  }
}
