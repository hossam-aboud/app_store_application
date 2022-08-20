import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
showLoading(context) {
  showDialog(
    
      context: context,
      builder: (context) {
         print("==========");
         print("Loading work");
        return AlertDialog(
          title: Text("Please Wait"),
          content: Container(
              height: 50, child: Center(child: CircularProgressIndicator())
       
              
              ),
        );
      });
}

String formattedData(timeStamp){
  var dateFromTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds *1000);
  return DateFormat('dd-MM-yyyy hh:mm a').format(dateFromTimeStamp);  
}