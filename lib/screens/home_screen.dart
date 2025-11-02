import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return  AppScaffold(
        body: LayoutBuilder(
            builder: (context, constraints) {
              final isLargeScreen = constraints.maxWidth > 600;
              final maxWidth = isLargeScreen ? 400.0 : constraints.maxWidth;

              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: maxWidth,
                    padding: EdgeInsets.all(screenWidth * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.05),

                        //logo
                        Image.asset(
                          'assets/logo/logo_app.png',
                          width: screenWidth * 0.6,
                        ),

                        //Title
                        Text(
                          'Can you name the flags of the world?',
                          style: TextStyle(
                            fontSize: screenWidth * (isLargeScreen ? 0.03 : 0.04),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: screenHeight * 0.1),

                        Text(
                          'Enter Your Name',
                          style: TextStyle(
                            fontSize: screenWidth * (isLargeScreen ? 0.03 : 0.06),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: screenHeight * 0.01),

                        //Name TextField
                        Container(
                          width: screenWidth * 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Your name",
                              hintStyle: TextStyle(
                                fontSize: screenWidth * 0.05,
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFA10D99),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(screenWidth * 0.03),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.025,
                                horizontal: screenWidth * 0.055,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // QuestionNumber
                        Text(
                          'Number Of Questions',
                          style: TextStyle(
                            fontSize: screenWidth * (isLargeScreen ? 0.02 : 0.04),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // aksi tombol 5
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFA10D99),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.all(screenWidth * 0.08),
                                elevation: 4,
                                shadowColor: Colors.black,
                              ),
                              child: Text(
                                ' 5 ',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.1),
                            ElevatedButton(
                              onPressed: () {
                                // aksi tombol 5
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFA10D99),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.all(screenWidth * 0.08),
                                elevation: 4,
                                shadowColor: Colors.black,
                              ),
                              child: Text(
                                '15',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // Sign In Button
                        SizedBox(
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.075,
                          child: ElevatedButton(
                            onPressed: () {
                              // aksi tombol start
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA10D99),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              elevation: 10,
                              shadowColor: Colors.black,
                            ),
                            child: Text(
                              'S t a r t',
                              style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w800,
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
        )
    );
  }
}