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
      ToDo(id: '1', todoText:'Wake UP' ),
      ToDo(id: '2', todoText: 'Mediatation'),
      ToDo(id: '3', todoText: 'Journalist'),
      ToDo(id: '4', todoText: 'Breakfast'),
      ToDo(id: '5', todoText: 'Flutter Coading'),
      ToDo(id: '5', todoText: 'Guitar'),

    ];
 }
 }
