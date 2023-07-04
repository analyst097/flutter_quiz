import 'package:dice/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.onAddExpense, super.key});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

 final _titleController = TextEditingController();
 final _descriptionController = TextEditingController();
 final _amountController = TextEditingController();
 DateTime? _selectedDate;
 Category _selectedCategory = Category.food;

 @override
 void dispose(){
   _titleController.dispose();
   _amountController.dispose();
   _descriptionController.dispose();
   super.dispose();
 }
 
 Future<void> _showDatePicker() async {
   final now = DateTime.now();
   final firstDate = DateTime(now.year-1, now.month-1, now.day);
   final pickedDate = await showDatePicker(
       context: context,
       initialDate: now,
       firstDate: firstDate,
       lastDate: now
   );

   setState(() {
     _selectedDate = pickedDate;
   });
 }

 void _submitData(){
   final amount = double.tryParse(_amountController.text);
   final amountIsInvalid = (amount == null || amount<= 0 );
   if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Invalid input"),
            content: const Text("Please make sure title, amount and date was entered."),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(ctx);
                  },
                  child: const Text("Okay"))
            ],
          )
      );
      return;
   }

   widget.onAddExpense(
       Expense(
           title: _titleController.text,
           amount: amount,
           category: _selectedCategory,
           dateTime: _selectedDate!,
           tags: []
       )
   );
 }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
           TextField(
             autofocus: true,
             controller: _titleController,
             maxLength: 50,
             decoration: const InputDecoration(
               label: Text('Title')
             ),
           ), TextField(
             controller: _descriptionController,
             maxLength: 100,
             decoration: const InputDecoration(
               label: Text('Description')
             ),
           ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefix: Text("Rs."),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              Text(_selectedDate == null ? "Select Date" : dateFormatter.format(_selectedDate!).toString()),
              TextButton(
                onPressed: _showDatePicker,
                child: const Icon(Icons.calendar_month)
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map(
                          (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toUpperCase()),)
                  ).toList(),
                  onChanged: (value){
                    setState(() {
                      if(value != null){
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                    });
                  }),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")
              ),
              const SizedBox(width: 16,),
              FilledButton(
                  onPressed: (){
                    Navigator.pop(context);
                    _submitData();
                  },
                  child: const Text("Save")
              ),

            ],
          )
        ],
      ),
    );
  }
}
