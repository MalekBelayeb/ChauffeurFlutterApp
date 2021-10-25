import 'package:flutter/material.dart';



class ChangePasswordChildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top:10,right:10,left:10,bottom:10),
      child: Card(

        child:  Padding(
          padding: EdgeInsets.only(top: 5,bottom: 20),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                child: Text("Changer mon mot de passe:",style: TextStyle(
                  fontFamily: "peugeot-bold",
                  fontSize: 18,
                  color: Colors.black,
                )
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
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

                                    Padding(
                                      padding: const EdgeInsets.only(top:15.0,right:8.0,left:8.0,bottom:8.0),
                                      child: Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Mdp actuel:",style: TextStyle(
                                            fontFamily: "peugeot-bold",
                                            fontSize: 14,
                                            color: Colors.black,
                                          )),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: new Border(
                                                bottom: new BorderSide(
                                                  width: 0.5,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            child: new TextFormField(
                                              obscureText: false,

                                              style: const TextStyle(
                                                fontFamily: "peugeot-regular",
                                                color: Colors.black,
                                              ),
                                              decoration: new InputDecoration(

                                                border: InputBorder.none,
                                                hintText: 'Entrer votre mdp actuel',
                                                hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                contentPadding: const EdgeInsets.only(
                                                    top: 10.0, right: 20.0, bottom:20.0, left: 5.0),
                                              ),
                                              onChanged: (value){

                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:15.0,right:8.0,left:8.0,bottom:8.0),
                                      child: Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Nouveau mdp:",style: TextStyle(
                                            fontFamily: "peugeot-bold",
                                            fontSize: 14,
                                            color: Colors.black,
                                          )),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: new Border(
                                                bottom: new BorderSide(
                                                  width: 0.5,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            child: new TextFormField(
                                              obscureText: false,

                                              style: const TextStyle(
                                                fontFamily: "peugeot-regular",
                                                color: Colors.black,
                                              ),
                                              decoration: new InputDecoration(

                                                border: InputBorder.none,
                                                hintText: 'Entrer votre nouveau mdp',
                                                hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                contentPadding: const EdgeInsets.only(
                                                    top: 10.0, right: 20.0, bottom:20.0, left: 5.0),
                                              ),
                                              onChanged: (value){

                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top:15.0,right:8.0,left:8.0,bottom:8.0),
                                      child: Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Confirmer nouveau mdp:",style: TextStyle(
                                            fontFamily: "peugeot-bold",
                                            fontSize: 14,
                                            color: Colors.black,
                                          )),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: new Border(
                                                bottom: new BorderSide(
                                                  width: 0.5,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            child: new TextFormField(
                                              obscureText: false,

                                              style: const TextStyle(
                                                fontFamily: "peugeot-regular",
                                                color: Colors.black,
                                              ),
                                              decoration: new InputDecoration(

                                                border: InputBorder.none,
                                                hintText: 'Confirmer votre nouveau mdp',
                                                hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                contentPadding: const EdgeInsets.only(
                                                    top: 15.0, right: 20.0, bottom:20.0, left: 5.0),
                                              ),
                                              onChanged: (value){

                                              },
                                            ),
                                          ),
                                        ],
                                      ),
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