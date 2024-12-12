

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/constraints/colors.dart';
import 'package:todo_app/todoItem.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist = ToDo.todoList();
  var _todoController = TextEditingController();
  List<ToDo>_foundtoDo = [];
  @override
  void initState() {
    _foundtoDo = todolist;
    super.initState();
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildappBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin:   EdgeInsets.only(top: 50,bottom: 20),
                        child: Text('All The TODO',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                      for(ToDo todo in _foundtoDo)
                        TodoItem(todo: todo,
                          onTodoChange: _handleToDoChange,
                          onDeleteItem: _deleteOnItem,
                        ),
                    ],
                  ),
                ),


              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      blurRadius:10.0,
                      offset: Offset(0.0, 0.0),
                      spreadRadius: 0.0,
                    )],
                    borderRadius: BorderRadius.circular(10)

                  ),

                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new ToDo',
                      border: InputBorder.none,


                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(onPressed: (){
                    _todoControllers(_todoController.text);

                  },
                      child: Text('+',style: TextStyle(fontSize: 40),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60,60),
                      elevation: 10,
                       foregroundColor: Colors.white,
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))


                    ),
                  ),

                ),



              ]
            ),
          )
        ],
      ),
    );
  }

  void runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todolist;
    }else{
      results = todolist.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundtoDo = results;
    });

  }
  void _todoControllers(String toDo){
    setState(() {
      todolist.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: toDo));

    });
    _todoController.clear();



  }
  void _handleToDoChange(ToDo todo ){
    setState(() {

    });
    todo.isDone = !todo.isDone;
    setState(() {

    });

  }
  void _deleteOnItem(String id){
    setState(() {

    });
    todolist.removeWhere((item) => item.id==id);

  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value)=>runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: tdBlack,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search'),
      ),
    );
  }

  AppBar _buildappBar() {
    return AppBar(
      backgroundColor: tdBgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/lokesh1.jpg'),
            ),
          )
        ],
      ),
    );
  }
}

class ToDo {
  String? id;
  String? todoText;
  late bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false

  });
  static List<ToDo> todoList(){
    return[
      ToDo(id: '1', todoText:'Wake UP',isDone: true ),
      ToDo(id: '2', todoText: 'Mediatation',isDone:true),
      ToDo(id: '3', todoText: 'Journalist'),
      ToDo(id: '4', todoText: 'Breakfast'),
      ToDo(id: '5', todoText: 'Flutter Coading'),
      ToDo(id: '5', todoText: 'Guitar'),

    ];
  }
}
