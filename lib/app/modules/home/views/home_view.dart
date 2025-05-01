import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final TextEditingController textController = TextEditingController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: const Text('To-Do List'),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter a new task',
                        icon: Icon(Icons.edit_note_outlined),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.blueAccent),
                    iconSize: 32,
                    onPressed: () {
                      if (textController.text.trim().isNotEmpty) {
                        controller.addTask(textController.text);
                        textController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.tasks.isEmpty) {
                  return const Center(
                    child: Text(
                      'No tasks yet. Add some!',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, index) {
                    final task = controller.tasks[index];
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: task.isCompleted ? Colors.redAccent.shade100 : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          activeColor: Colors.black,
                          value: task.isCompleted,
                          onChanged: (_) => controller.toggleTask(index),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            fontSize: 16,
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: task.isCompleted ? Colors.grey : Colors.black,
                          ),
                        ),
                        trailing: Text(
                          task.isCompleted ? "Completed" :"Pending",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: task.isCompleted? Colors.white: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}