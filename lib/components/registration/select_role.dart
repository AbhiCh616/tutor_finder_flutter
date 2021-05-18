import 'package:flutter/material.dart';

class SelectRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text(
                'Select Role',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'What describes you best?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              // Tutor option
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  height: 165,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        print("tapped");
                      },
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 10,
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/tutor.png'),
                            Text(
                              'Tutor',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Student option
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 165,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        print("tapped");
                      },
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 10,
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/student.png'),
                            Text(
                              'Student',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
