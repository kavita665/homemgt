import 'package:scoped_model/scoped_model.dart';
import 'combined_model.dart';

class MainModel extends Model with CombinedModel, UserModel, ExpensesModel, FilterModel{} 

