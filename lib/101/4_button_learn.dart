import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }
                return null;
              })),
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const ElevatedButton(onPressed: null, child: Text('Data')),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.blue;
                }),
                textStyle: MaterialStateProperty.resolveWith((states) {
                  // If the button is pressed, return size 40, otherwise 20
                  if (states.contains(MaterialState.pressed)) {
                    return const TextStyle(fontSize: 40);
                  }
                  return const TextStyle(fontSize: 20);
                }),
              ),
              child: const Text("Changing Button"),
              onPressed: () {},
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
            FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {},
              child: const SizedBox(
                width: 200,
                child: Text('data'),
              ),
            ),
            InkWell(onTap: () {}, child: const Text('data')),
            Container(
              height: 100,
              color: Colors.amber,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Text(
                    'Place Bid',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// borders
// circleborder, roundedrectangleborder