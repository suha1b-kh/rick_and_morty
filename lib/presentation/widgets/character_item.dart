import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: NetworkImage(character.image),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      character.name,
                      style: TextStyle(
                        color: Color(0xFF1B2A57),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                width: 20,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: ShapeDecoration(
                  color: Color(0xFF11C72E),
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(
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