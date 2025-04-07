// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/database_service.dart';
import '../models/expense_model.dart';
import 'add_expense_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  final DatabaseService _database = DatabaseService();
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        backgroundColor: primaryColor,
      ),
      body: StreamBuilder<List<Expense>>(
        stream: _database.getExpenses(userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final expenses = snapshot.data!;
            return ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return ListTile(
                  title: Text(expense.title),
                  subtitle: Text('${expense.date.toString().substring(0, 10)} - ${expense.category}'),
                  trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading expenses'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpenseScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: accentColor,
      ),
    );
  }
}