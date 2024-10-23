import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/pages/home_page.dart';
import 'package:my_event_app/pages/stat/statbyevent.dart';
class GlobalStat extends StatefulWidget {
  const GlobalStat({super.key});

  @override
  State<GlobalStat> createState() => _GlobalStatState();
}

class _GlobalStatState extends State<GlobalStat> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Statistiques",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                  ),
                                  child: Text("Global Stats",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              )
                            ],
                          ),
                ) , 
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height*0.35,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  // width: MediaQuery.of(context).size.width* ,
                ) , 
                SizedBox(height: 20,),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin:EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade300,
                              ),
                              child: Icon(Icons.confirmation_num, color: Colors.grey.shade700, size: 25),
                            ),
                            SizedBox(width: 8,),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("TICKETS VENDUS", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:  Colors.grey.shade800, letterSpacing: 0.00)),
                                    Text("476", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ,color: const Color.fromARGB(255, 28, 37, 136),letterSpacing: 0.00))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade300,
                              ),
                              child: Icon(Icons.monetization_on, color: Colors.grey.shade700, size: 25),
                            ),
                            SizedBox(width: 8,),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("REVENUS TOTAL", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:  Colors.grey.shade800, letterSpacing: 0.00)),
                                    Text("405k", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ,color: const Color.fromARGB(255, 28, 37, 136),letterSpacing: 0.00))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade300,
                              ),
                              child: Icon(Icons.event_available_outlined, color: Colors.grey.shade700, size: 25),
                            ),
                            SizedBox(width: 8,),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("NOMBRE D'EVENEMENT", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:  Colors.grey.shade800, letterSpacing: 0.00)),
                                    Text("8", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ,color: const Color.fromARGB(255, 28, 37, 136),letterSpacing: 0.00))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ) ,
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Container(
                                    margin:EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   padding: EdgeInsets.all(8),
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(8),
                                        //     color: Colors.grey.shade300,
                                        //   ),
                                        //   child: Icon(Icons.event_available_outlined, color: Colors.grey.shade700, size: 25),
                                        // ),
                                        SizedBox(width: 8,),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Evenement passé", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:  Colors.grey.shade800, letterSpacing: 0.00)),
                                                Text("3", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ,color: const Color.fromARGB(255, 28, 37, 136),letterSpacing: 0.00))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(width: 10,),
                             Expanded(
                              child: Container(
                                child: Container(
                                    margin:EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   padding: EdgeInsets.all(8),
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(8),
                                        //     color: Colors.grey.shade300,
                                        //   ),
                                        //   child: Icon(Icons.event_available_outlined, color: Colors.grey.shade700, size: 25),
                                        // ),
                                        SizedBox(width: 8,),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Evenement a venir", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:  Colors.grey.shade800, letterSpacing: 0.00)),
                                                Text("2", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ,color: const Color.fromARGB(255, 28, 37, 136),letterSpacing: 0.00))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ) ,
                      Container(
                        margin:EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Viewers" ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:  Colors.black, letterSpacing: 0.00)),
                            ),
                            SizedBox(width: 40,),
                            Container(
                              child: Row(
                                children: [                
                                          Container(
                                            padding: EdgeInsets.all(0),
                                            child: Text("31420" , style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.black ,letterSpacing: 0.00)),
                                          ),
                                          SizedBox(width: 5),
                                          Container(
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Icon(Icons.group, color:const Color.fromARGB(255, 28, 37, 136), size: 30),
                                          ),
                                        ],
                              ),
                            )

                            
                          ],
                        ),
                      ) ,

                      Container(
                        margin:EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Favoris" ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:  Colors.black, letterSpacing: 0.00)),
                            ),
                            SizedBox(width: 40,),
                            Container(
                              child: Row(
                                children: [                
                                          Container(
                                            padding: EdgeInsets.all(0),
                                            child: Text("2500" , style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.black ,letterSpacing: 0.00)),
                                          ),
                                          SizedBox(width: 5),
                                          Container(
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Icon(Icons.favorite_rounded, color: Colors.red , size: 30),
                                          ),
                                        ],
                              ),
                            )

                            
                          ],
                        ),
                      ) ,
                      Container(
                        margin:EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Commentaires " ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:  Colors.black, letterSpacing: 0.00)),
                            ),
                            SizedBox(width: 40,),
                            Container(
                              child: Row(
                                children: [                
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child: Text("752" , style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.black ,letterSpacing: 0.00)),
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(Icons.comment, color:Colors.green, size: 25),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                      ) ,
                      
                      
                    ],
                  ),
                ) ,
                SizedBox(height: 30,),
                 GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return StatByEvent();
                    }));
                  },
                   child: Container(
                    padding: EdgeInsets.symmetric(horizontal:20  , vertical: 15),
                    decoration: BoxDecoration(
                      color:  Colors.indigo[900],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text("Statistique par evenement",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                                SizedBox(width: 10,) ,
                                Icon(Icons.navigate_next , color:Colors.white, size: 30)
                      ],
                   
                    ),
                   ),
                 )
              ],
            ),
          ),
        ),
      ),
     
    );
  }
}
