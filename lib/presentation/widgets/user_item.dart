import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/users.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF2F4F7),
          borderRadius: BorderRadius.circular(15),
        ),
        width: 335,
        height: 120,
        child: Stack(children: [
          Row(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: Color(0xFF1B2A57),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Case Information',
                      style: TextStyle(
                        color: Color(0xFF7CA0CA),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: const ShapeDecoration(
                  color: Color(0xFF11C72E),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Image.asset('assets/images/arrow.png')
            ],
          ),
        ]),
      ),
    );
  }
}


/**
 * 
 * 
 * 
 * 
 * import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget patientCard(String image, String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 335,
      height: 120,
      child: Stack(children: [
        Row(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Color(0xFF1B2A57),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Case Information',
                    style: TextStyle(
                      color: Color(0xFF7CA0CA),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 10,
              height: 10,
              decoration: ShapeDecoration(
                color: Color(0xFF11C72E),
                shape: OvalBorder(),
              ),
            ),
          ],
        ),
      ]),
    ),
  );
}

 */