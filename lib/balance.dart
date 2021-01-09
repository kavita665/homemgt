//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body:  Container(
        margin:EdgeInsets.only(top:20) ,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: size.height*.3,
                width:size.width,
                //color:Colors.tealAccent,
                child: 
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Balance",
                style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
              ),
              decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://picsum.photos/200/300.jpg",
                        ),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.teal, BlendMode.overlay))),
         
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Income",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                    Text("View All",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ))
                
                  ],
                  
                ),
              ),
              ListTile(leading:Icon(Icons.youtube_searched_for_outlined),
              title: Text("Youtube"),subtitle: Text("Adsense"),
              trailing: Text("+Rp 5,000.00"),

              ),
               ListTile(leading:Icon(Icons.money),
              title: Text("Bank"),subtitle: Text("Salary"),
              trailing: Text("+Rp 8,500.00"),

              ),
            ],
            
          
        ),
      ),
      
    );
  }
}