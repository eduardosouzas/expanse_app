import 'dart:convert';

import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;
  
  Transaction({
    @required this.id,
    this.title,
    this.value,
    this.date,
  });

  

  @override
  String toString() {
    return 'Transaction(id: $id, title: $title, value: $value, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Transaction &&
      o.id == id &&
      o.title == title &&
      o.value == value &&
      o.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      value.hashCode ^
      date.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'date': date?.millisecondsSinceEpoch,
    };
  }

  static Transaction fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Transaction(
      id: map['id'],
      title: map['title'],
      value: map['value'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  static Transaction fromJson(String source) => fromMap(json.decode(source));
}
