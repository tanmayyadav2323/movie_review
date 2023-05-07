import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../authentication/services/auth_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = "Devarsh Ukani";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 4.h),
            const Text(
              "Profile",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6.h),
            const CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/33.jpg'),
            ),
            SizedBox(height: 2.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _username,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: SizedBox(
                    height: 60.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _showEditDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFF202020),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: SizedBox(
                    height: 60.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        AuthService().logOut(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFF202020),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // TextButton(
                //   style: TextButton.styleFrom(
                //       primary: Colors.white, backgroundColor: Colors.white12),
                //   onPressed: () {
                //     _showEditDialog();
                //   },
                //   child: const Text(
                //     'Edit Profile',
                //     style: TextStyle(fontSize: 18),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 30),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      child: const Text(
                        "Terms & Conditions",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        // Navigate to terms and conditions page here
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      child: const Text(
                        "About App",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        // Navigate to about app page here
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(5.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0XFF272727),
                    hintText: 'Enter new username',
                    hintStyle: TextStyle(
                      color: Color(0xFFB4B4B4),
                    ),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Color(0XFFb4b4b4)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFF0a0a0a),
                        ),
                        child: const Text('Save'),
                        onPressed: () {
                          // Save username here
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
