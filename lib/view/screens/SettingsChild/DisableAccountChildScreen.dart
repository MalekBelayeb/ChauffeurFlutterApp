import 'package:flutter/material.dart';



class DisableAccoundChildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Container(
        margin: EdgeInsets.only(top:10,right:10,left:10,bottom:10),
        child: Card(

          child:  Padding(
            padding: EdgeInsets.only(top: 5,bottom: 20),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10,top: 5,bottom: 0),
                  child: Text("Desactiver mon compte:",style: TextStyle(
                    fontFamily: "peugeot-bold",
                    fontSize: 18,
                    color: Colors.black,
                  )
                  ),
                ),
                Column(
                  //alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Padding(
                      padding:EdgeInsets.all(12),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Aprés la confirmation de cette opération vous ne pouvez plus vous connecter.",style:TextStyle(
                            fontFamily: "peugeot-regular",
                            fontSize: 12,
                            color: Colors.black,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Form(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Container(

                                          alignment: FractionalOffset.center,
                                          decoration:BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromRGBO(255,0,0,1),                                                  width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))
                                          )
                                          ,

                                          child: Padding(
                                              padding: EdgeInsets.all(7),
                                              child:Text(
                                                "Desactiver maintenant",
                                                style: new TextStyle(
                                                  fontFamily: "peugeot-bold",
                                                  color: Color.fromRGBO(255,0,0,1),
                                                  fontSize: 14.0,
                                                ),
                                              )
                                          )
                                      )


                                    ],

                                  ))],
                          ),
                        ),


                      ],
                    )],
                )


              ],


            ),

          ),
        ),
      );
  }



}
