import 'package:candly/helpers/candly_icons_icons.dart';
import 'package:flutter/material.dart';

import '../../helpers/custom_colors.dart';

class AmountSelection extends StatefulWidget {
  const AmountSelection({Key? key}) : super(key: key);

  @override
  State<AmountSelection> createState() => _AmountSelectionState();
}

class _AmountSelectionState extends State<AmountSelection> {
  int amount = 0; //to store the amount entered
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: mediaQuery.height * .055,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor:
                      MaterialStateProperty.all(CustomColors.surface3),
                  minimumSize: MaterialStateProperty.all(
                      Size(mediaQuery.width * .065, mediaQuery.height * .054))),
              onPressed: () {
                if (amount >= 100) {
                  amount -= 100;
                  controller.text = amount.toString();
                }
              },
              child: Icon(
                CandlyIcons.property_1_loss,
                size: mediaQuery.width * .025,
                color: Colors.white,
              )),
          SizedBox(
            height: mediaQuery.height * .055,
            width: mediaQuery.width * .3,
            child: TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  amount = int.parse(value);
                }
              },
              controller: controller,
              textInputAction: TextInputAction.done,
               textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style:  TextStyle(color: Colors.white, fontFamily: 'Khand',fontSize: mediaQuery.width*.05),
              decoration: InputDecoration(
               // prefixIcon: const Icon(Icons.attach_money_rounded,color: Colors.white60,size: 20,),
                  hintText: "Amount",
                  hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Khand',fontSize: mediaQuery.width*.04),
                  filled: true,
                  fillColor: CustomColors.surface3,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          ElevatedButton(
              //plus button
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor:
                      MaterialStateProperty.all(CustomColors.surface3),
                  minimumSize: MaterialStateProperty.all(
                      Size(mediaQuery.width * .065, mediaQuery.height * .054))),
              onPressed: () {
                setState(() {
                  amount += 100;
                  controller.text = amount.toString();
                });
              },
              child: Icon(
                CandlyIcons.property_1_add,
                size: mediaQuery.width * .03,
              )),
        ],
      ),
    );
  }
}
