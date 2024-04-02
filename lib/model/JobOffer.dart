import 'package:flutter/material.dart';

class JobOffer {
  final int offerId;
  final String title;
  final String description;
  final String location;
  final double budget; // BigDecimal en Java pourrait être représenté par un double en Dart
  final DateTime startDate;
  final int duration;
  final String status; // Enum en Java peut être une String en Dart ou vous pouvez aussi utiliser un Enum Dart
  // Ajoutez d'autres champs si nécessaire

  JobOffer({
    required this.offerId,
    required this.title,
    required this.description,
    required this.location,
    required this.budget,
    required this.startDate,
    required this.duration,
    required this.status,
  });

  // Méthode pour créer une instance de JobOffer à partir d'un JSON
  factory JobOffer.fromJson(Map<String, dynamic> json) => JobOffer(
        offerId: json['offerId'],
        title: json['title'],
        description: json['description'],
        location: json['location'],
        budget: json['budget'].toDouble(),
        startDate: DateTime.parse(json['startDate']),
        duration: json['duration'],
        status: json['status'],
      );
}
