// ignore_for_file: prefer_const_constructors

import 'package:contact_list/ui/page/contact_list_api_service.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  bool responseStatus = false;
  @override
  void initState() {
    super.initState();
    dataFetching();
  }

  void dataFetching()async{
    await fetchData();
    
    setState(() {
      responseStatus=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                  
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  )),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                        child: Text(
                      "Contacts",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(23, 20, 86, 1)),
                    )),
                  )),
              Expanded(child: Text(""))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                59,
            child: responseStatus == false
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 5, right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 1.5,
                                  color: Color.fromRGBO(205, 210, 214, 1))),
                          padding: EdgeInsets.only(top: 9, bottom: 9),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.brown,
                              radius: 30,
                              child: Text(
                                responseData[index]["ContactName"][0],
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white,),
                              ),
                            ),
                            title: Text(
                              responseData[index]["ContactName"],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(31, 30, 96, 1)),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                responseData[index]['AccountName'],
                                style: TextStyle(
                                    color: Color.fromRGBO(64, 63, 120, 1)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: responseData.length,
                  ),
          ),
        ],
      ),
    );
  }
}
