import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constraints/colors.dart';
import 'package:todo_app/home.dart';

class TodoItem extends StatelessWidget{
  final ToDo todo;
  final onTodoChange;
  final onDeleteItem;
  const TodoItem({Key?key,required this.todo,required this.onTodoChange,required this.onDeleteItem}):super(key: key);
  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          onTodoChange(todo);

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(todo.isDone?Icons.check_box:Icons.check_box_outline_blank,color: tdBlue,),
        title: Text(todo.todoText!,style: TextStyle(fontSize: 16,color: tdBlack,
            decoration: todo.isDone?TextDecoration.lineThrough:TextDecoration.none),),

        contentPadding: EdgeInsets.symmetric(vertical:5,horizontal: 20 ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),

            
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);

            },
          ),

        ),
      ),

    );

  }
}