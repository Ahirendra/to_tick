    import 'package:flutter/material.dart';
    import 'package:hive_flutter/hive_flutter.dart';
    import 'package:to_trick/util/todo_tile.dart';
    import '../data/database.dart';
    import '../util/dialog_box.dart';

   class HomePage extends StatefulWidget{
      const HomePage({super.key});
      @override
      State<HomePage> createState() => _HomePageState();
   }
   class _HomePageState extends State<HomePage> {
         final _myBox = Hive.box('mybox');
         ToDoDataBase db = ToDoDataBase();


         @override
         void initState() {
           // if this is the 1st time ever opening the app, then create default data
           if (_myBox.get("TODOLIST") == null) {
             db.createInitialData();
           } else {
             // there already exists data
             db.loadData();
           }

           super.initState();
         }




        // text controller
        final _controller = TextEditingController();

        // checkbox was tapped
        void checkBoxChanged(bool? value, int index) {
          setState(() {
            db.toDoList[index][1] = !db.toDoList[index][1];
          });
          db.updateDataBase();
        }





        // save new task
        void saveNewTask() {
          setState(() {
            db.toDoList.add([_controller.text, false]);
            _controller.clear();
          });
          Navigator.of(context).pop();
          db.updateDataBase();
        }

        // create a new task
        void createNewTask() {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                controller: _controller,
                onSave: saveNewTask,
                onCancel: () => Navigator.of(context).pop(),
              );
            },
          );
        }

        // delete task
        void deleteTask(int index) {
          setState(() {
            db.toDoList.removeAt(index);
          });
          db.updateDataBase();
        }






        @override
        Widget build(BuildContext context) {
          return  Scaffold(
            backgroundColor: Colors.pink[50],
            appBar: AppBar(
              title: const Text('TO DO'),
              centerTitle: true,
              backgroundColor: Colors.pink[300],
              elevation: 0,
            ),
              floatingActionButton: FloatingActionButton(
                  onPressed: createNewTask,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.pink[200],
                  hoverColor: Colors.pink[100],
              ),
            body: ListView.builder(
                itemCount: db.toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoTile(
                    taskName: db.toDoList[index][0],
                    taskCompleted: db.toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) => deleteTask(index),
                  );
                },
            ),
          );
         }
   }