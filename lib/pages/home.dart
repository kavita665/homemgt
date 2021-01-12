import 'package:flutter/material.dart';
import 'package:homemgt/models/category.dart';
import 'package:homemgt/pages/settings.dart';
import 'package:homemgt/scoped_models/main.dart';
import 'package:homemgt/widgets/expenses/expenses_builder.dart';
import 'package:homemgt/widgets/navigation/side_drawer.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../main.dart';
import 'add_expense.dart';


List<Category> categories;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    ExpensesList(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  _buildDrawer() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget widget, MainModel model) {
        categories = model.allCategories;
        return SideDrawer(model.updateCategoryFilter, model.updateSort,
            model.sortBy, model.allCategories, model.startDate, model.endDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deviceTheme == "light"
          ? Colors.grey[100]
          : Theme.of(context).primaryColorLight,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddExpense(),
                  ),
                );
              },
              backgroundColor: Theme.of(context).primaryColorLight,
              elevation: 5.0,
              icon: const Icon(Icons.add),
              label: const Text('Add Expense'),
            )
          : Container(
              width: 0,
              height: 0,
            ),
      drawer: _buildDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        color: deviceTheme == "light" ? Colors.white : Colors.grey[900],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  MdiIcons.cashRegister,
                  size: 30,
                  color: _selectedIndex == 0
                      ? Theme.of(context).accentColor
                      : Colors.grey[500],
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.accountSettings,
                  size: 30,
                  color: _selectedIndex == 1
                      ? Theme.of(context).accentColor
                      : Colors.grey[500],
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
