import 'package:flutter/material.dart';

class GoldCalculate {
  // Function to calculate final making charges
   static void _calculateFinalMakingCharges({
    required String sRate,
    required String sWeight,
    required String sMakingCharges,
    required String? mkgChargesType,
    required TextEditingController finalMkgChargesController,
  }) {
    double goldRate = double.tryParse(sRate) ?? 0; // Gold rate per gram
    double weight = double.tryParse(sWeight) ?? 0; // Net weight of the gold
    double mkgCharges =
        double.tryParse(sMakingCharges) ?? 0; // Entered making charges value

    if (mkgChargesType == "Percentage") {
      // Calculate percentage-based making charges
      double finalMakingCharges = (goldRate * weight * mkgCharges) / 100;
      finalMkgChargesController.text =
          finalMakingCharges.toStringAsFixed(2); // Update final making charges
    } else if (mkgChargesType == "Per Gram") {
      // Calculate per gram-based making charges
      double finalMakingCharges = mkgCharges * weight;
      finalMkgChargesController.text =
          finalMakingCharges.toStringAsFixed(2); // Update final making charges
    }
  }

  // Function to calculate GST
  static void _calculateGST({
    double gstPercentage = 3,
    required String sRate,
    required String sWeight,
    required String finalMkgCharges,
    required TextEditingController gstController,
  }) {
    double goldRate = double.tryParse(sRate) ?? 0; // Gold rate per gram
    double weight = double.tryParse(sWeight) ?? 0; // Net weight of the gold
    double makingCharges =
        double.tryParse(finalMkgCharges) ?? 0; // Final making charges

    // Calculate total gold price
    double totalGoldPrice = goldRate * weight;

    // Calculate GST on both gold price and making charges
    double gst = (totalGoldPrice + makingCharges) * (gstPercentage / 100);

    gstController.text = gst.toStringAsFixed(2);
  }

  // Function to calculate the final price of the product
  static void _calculateFinalPrice({
    required String sRate,
    required String sWeight,
    required String finalMkgCharges,
    required String gst,
    required TextEditingController finalPriceController,
  }) {
    double goldRate = double.tryParse(sRate) ?? 0; // Gold rate per gram
    double weight = double.tryParse(sWeight) ?? 0; // Net weight of the gold
    double makingCharges =
        double.tryParse(finalMkgCharges) ?? 0; // Final making charges
    double gstAmount = double.tryParse(gst) ?? 0; // GST amount

    // Calculate total gold price
    double totalGoldPrice = goldRate * weight;

    // Calculate the final price including gold price, making charges, and GST
    double finalPrice = totalGoldPrice + makingCharges + gstAmount;

    // Update the final price controller
    finalPriceController.text = finalPrice.toStringAsFixed(2);
  }

  // Function to call all calculations at once (cleaner code)
  static void calculateAll({
    required String sRate,
    required String sWeight,
    required String sMakingCharges,
    required String? mkgChargesType,
    required TextEditingController finalMkgChargesController,
    required TextEditingController gstController,
    required TextEditingController finalPriceController,
    double gstPercentage = 3,
  }) {
    // Step 1: Calculate Final Making Charges
    _calculateFinalMakingCharges(
      sRate: sRate,
      sWeight: sWeight,
      sMakingCharges: sMakingCharges,
      mkgChargesType: mkgChargesType,
      finalMkgChargesController: finalMkgChargesController,
    );

    // Step 2: Calculate GST
    _calculateGST(
      gstPercentage: gstPercentage,
      sRate: sRate,
      sWeight: sWeight,
      finalMkgCharges: finalMkgChargesController.text,
      gstController: gstController,
    );

    // Step 3: Calculate Final Price
    _calculateFinalPrice(
      sRate: sRate,
      sWeight: sWeight,
      finalMkgCharges: finalMkgChargesController.text,
      gst: gstController.text,
      finalPriceController: finalPriceController,
    );
  }
}
