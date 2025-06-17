import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/core/funcations/custom_toast.dart';
import 'package:todo_list/core/funcations/navigation.dart';
import 'package:todo_list/core/helper/spacing.dart';
import 'package:todo_list/core/utils/app_assets.dart';
import 'package:todo_list/core/utils/app_colors.dart';
import 'package:todo_list/core/utils/custom_text_style.dart';
import 'package:todo_list/core/widgets/custom_bottom.dart';
import 'package:todo_list/features/home/data/database.dart';
import 'package:todo_list/features/home/presentation/widgets/custom_awesome_dialog_box.dart';
import 'package:todo_list/features/home/presentation/widgets/profile_image_and_welcome_text.dart';
import 'package:todo_list/features/home/presentation/widgets/to_do_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void addNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      db.updateDataBase();
    } else {
      customToast(meg: 'Enter some text', backgroundColor: AppColors.red);
    }
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImageAndWelcomeText(name: 'Welcome Zidan!'),
            verticalSpace(19),
            Center(child: SvgPicture.asset(Assets.imagesTaskBro, height: 246)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today Tasks: ${db.toDoList.length}",
                    style: CustomTextStyle.poppins20W500Black.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  verticalSpace(21),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 32),
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Diary Tasks.",
                              style: CustomTextStyle.poppins13W500Black
                                  .copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff878787),
                                  ),
                            ),
                            GestureDetector(
                              onTap: () {
                                customAwesomeDialogBox(
                                  context,
                                  controller: _controller,
                                  btnOkOnPress: addNewTask,
                                ).show();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(17),
                        Expanded(
                          child: Scrollbar(
                            // thumbVisibility: true,
                            thickness: 5,
                            trackVisibility: true,
                            interactive: true,
                            child:
                                db.toDoList.isNotEmpty
                                    ? ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: db.toDoList.length,
                                      itemBuilder: (context, index) {
                                        return ToDoTile(
                                          onPressed:
                                              (context) => deleteTask(index),
                                          taskName: db.toDoList[index][0],
                                          taskCompleted: db.toDoList[index][1],
                                          onChanged:
                                              (value) =>
                                                  checkBoxChanged(value, index),
                                        );
                                      },
                                    )
                                    : Center(
                                      child: Text(
                                        "No Tasks For Today",
                                        style: TextStyle(
                                          color: Color(0xff878787),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 85.0),
              child: MyCustomButtom(
                text: "Logout",
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  customnavigate(context, '/login');
                },
              ),
            ),
            verticalSpace(15),
          ],
        ),
      ),
    );
  }
}
