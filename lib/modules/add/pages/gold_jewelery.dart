import 'package:aurate/export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GoldJewelery extends StatefulWidget {
  const GoldJewelery({super.key});

  @override
  State<GoldJewelery> createState() => _GoldJeweleryState();
}

class _GoldJeweleryState extends State<GoldJewelery> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController mkgChargesController = TextEditingController();
  final TextEditingController finalMkgChargesController =
      TextEditingController(text: "0.0");
  final TextEditingController gstPercentController =
      TextEditingController(text: "3.0");
  final TextEditingController gstController =
      TextEditingController(text: "0.0");
  final TextEditingController finalPriceController =
      TextEditingController(text: "0.0");
  final scraper = GoldRateScraper();
  String? mkgChargesType = "Percentage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gold Jewellery Sale',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.chevron_left,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Form(
              child: FutureBuilder(
                future: scraper.scrapeGoldRates(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      for (var i = 0; i < snapshot.data!.length; i++) {
                        if (snapshot.data?[i].purity == "22K") {
                          rateController.text =
                              snapshot.data![i].ratePerGm.toString();
                        }
                      }
                      return ListView(
                        children: [
                          const Gap(10),
                          InputField(
                            label: 'Net Weight',
                            onChanged: (value) {
                              GoldCalculate.calculateAll(
                                  sRate: rateController.text,
                                  sWeight: weightController.text,
                                  sMakingCharges: mkgChargesController.text,
                                  gstController: gstController,
                                  mkgChargesType: mkgChargesType,
                                  finalMkgChargesController:
                                      finalMkgChargesController,
                                  finalPriceController: finalPriceController);
                            },
                            suffix: Text("g"),
                            controller: weightController,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(15),
                          const Text(
                            "Making Charges Type",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          DropdownButton<String>(
                            value: mkgChargesType,
                            iconSize: 24,
                            elevation: 16,
                            // underline: Container(height: 2),
                            onChanged: (String? newValue) {
                              setState(() {
                                mkgChargesType = newValue;
                              });
                              GoldCalculate.calculateAll(
                                  sRate: rateController.text,
                                  sWeight: weightController.text,
                                  sMakingCharges: mkgChargesController.text,
                                  gstController: gstController,
                                  mkgChargesType: mkgChargesType,
                                  finalMkgChargesController:
                                      finalMkgChargesController,
                                  finalPriceController: finalPriceController);
                            },
                            items: <String>["Percentage", "Per Gram", "Manual"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const Gap(15),
                          mkgChargesType == "Manual"
                              ? Container()
                              : InputField(
                                  label: 'Making Charges ($mkgChargesType)',
                                  onChanged: (value) {
                                    GoldCalculate.calculateAll(
                                        sRate: rateController.text,
                                        sWeight: weightController.text,
                                        sMakingCharges:
                                            mkgChargesController.text,
                                        gstController: gstController,
                                        mkgChargesType: mkgChargesType,
                                        finalMkgChargesController:
                                            finalMkgChargesController,
                                        finalPriceController:
                                            finalPriceController);
                                  },
                                  suffix: mkgChargesType == "Percentage"
                                      ? Text("%")
                                      : Text("/g"),
                                  controller: mkgChargesController,
                                  keyboardType: TextInputType.number,
                                ),
                          Gap(mkgChargesType == "Manual" ? 0 : 15),
                          InputField(
                            enabled: false,
                            prefix: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Text(
                                "22K",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            label: 'Rate',
                            suffix: Text("/g"),
                            controller: rateController,
                          ),
                          const Gap(15),
                          InputField(
                            enabled: mkgChargesType == "Manual" ? true : false,
                            label: 'Final making Charges',
                            suffix: Text("₹"),
                            controller: finalMkgChargesController,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(15),
                          InputField(
                            enabled: false,
                            label: 'GST (%)',
                            suffix: Text("%"),
                            onChanged: (value) {
                              GoldCalculate.calculateAll(
                                  sRate: rateController.text,
                                  sWeight: weightController.text,
                                  sMakingCharges: mkgChargesController.text,
                                  gstController: gstController,
                                  mkgChargesType: mkgChargesType,
                                  finalMkgChargesController:
                                      finalMkgChargesController,
                                  finalPriceController: finalPriceController);
                            },
                            controller: gstPercentController,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(15),
                          InputField(
                            enabled: false,
                            label: 'GST',
                            suffix: Text("₹"),
                            controller: gstController,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(15),
                          InputField(
                            enabled: false,
                            label: 'Final Price',
                            suffix: Text("₹"),
                            controller: finalPriceController,
                            keyboardType: TextInputType.number,
                          ),
                          const Gap(15),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                            child: Text("Add Gold Jewellery Sale"),
                          )
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("Some error occured"),
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
