import 'package:expense_tracker/data/colors.dart';
import 'package:expense_tracker/screens/add_expense/icon_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _newCategoryNameController =
      TextEditingController();
  final TextEditingController _newCategoryColorController =
      TextEditingController();

  DateTime _selectedDate = DateTime.now();
  bool _isIconExpanded = false;
  late Color categoryColor = Colors.transparent;

  @override
  void initState() {
    _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    _expenseController.dispose();
    _categoryController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();
    _newCategoryNameController.dispose();
    _newCategoryColorController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconNotifier = Provider.of<IconNotifier>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const Text('Agregar Transacción'),
          actions: [
            if (iconNotifier.selectedIcon != null)
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.trashCan),
                onPressed: () {
                  iconNotifier.resetIcon();
                  _categoryController.clear();
                },
              ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Campo de cantidad
              _buildAmountField(),
              const SizedBox(height: 32),
              // Campo de categoría
              _buildCategoryField(context, iconNotifier),
              const SizedBox(height: 16),
              // Campo de fecha
              _buildDateField(),
              const SizedBox(height: 16),
              // Campo de descripción
              _buildDescriptionField(),
              const SizedBox(height: 32),
              // Botón de guardar
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Campo de cantidad
  Widget _buildAmountField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: _expenseController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.InputColorDecoration,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(20.0),
            child: FaIcon(
              FontAwesomeIcons.dollarSign,
              size: 16,
              color: AppColors.grayIcons,
            ),
          ),
          hintText: 'Cantidad',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Campo de categoría
  Widget _buildCategoryField(BuildContext context, IconNotifier iconNotifier) {
    return TextFormField(
      controller: _categoryController,
      readOnly: true,
      onTap: () {},
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.InputColorDecoration,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              iconNotifier.selectedIcon != null
                  ? FaIcon(
                    iconNotifier.selectedIcon,
                    size: 20,
                    color: AppColors.grayIcons,
                  )
                  : const FaIcon(
                    FontAwesomeIcons.list,
                    size: 20,
                    color: AppColors.grayIcons,
                  ),
        ),
        suffixIcon: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.plus,
            size: 16,
            color: AppColors.grayIcons,
          ),
          onPressed: () => _showCategoryDialog(context),
        ),
        label: const Text('Categoría'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Campo de fecha
  Widget _buildDateField() {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.InputColorDecoration,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(20.0),
          child: FaIcon(
            FontAwesomeIcons.calendar,
            size: 16,
            color: AppColors.grayIcons,
          ),
        ),
        label: const Text('Fecha'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Campo de descripción
  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      maxLines: 3,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.InputColorDecoration,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(20.0),
          child: FaIcon(
            FontAwesomeIcons.pen,
            size: 16,
            color: AppColors.grayIcons,
          ),
        ),
        label: const Text('Descripción'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Botón de guardar
  Widget _buildSaveButton(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 4,
      child: Container(
        width: double.infinity,
        height: kToolbarHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _saveExpense,
          child: const Center(
            child: Text(
              'Guardar',
              style: TextStyle(
                color: AppColors.textPrimaryDark,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Mostrar diálogo para agregar nueva categoría
  void _showCategoryDialog(BuildContext context) {
    final iconNotifier = Provider.of<IconNotifier>(context, listen: false);
    _newCategoryNameController.clear();
    _newCategoryColorController.clear();

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text('Nueva Categoría'),
                content: SizedBox(
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //Nombre de la categoría
                        TextFormField(
                          controller: _newCategoryNameController,
                          decoration: InputDecoration(
                            labelText: 'Nombre de la categoría',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Color de la categoría
                        TextFormField(
                          readOnly: true,
                          controller: _newCategoryColorController,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx2) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ColorPicker(
                                        pickerColor: AppColors.pickerColor,
                                        onColorChanged: (value) {
                                          setState(() {
                                            categoryColor = value;
                                            _newCategoryColorController.text =
                                                '#${value.value.toRadixString(16).substring(2, 8)}';
                                          });
                                        },
                                      ),
                                      Material(
                                        borderRadius: BorderRadius.circular(8),
                                        elevation: 2,
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: AppColors.btnGradient,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            onTap: () {
                                              Navigator.pop(ctx2);
                                            },
                                            child: const Center(
                                              child: Text(
                                                'Seleccionar Color',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          decoration: InputDecoration(
                            labelText: 'Color de la categoría',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: Padding(padding: const EdgeInsets.all(8),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: categoryColor ?? AppColors.textDisabled,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.outline)
                              ),
                            ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Selector de Icono
                        _buildIconSelector(context, setState, iconNotifier),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_validateCategoryForm(iconNotifier)) {
                        _categoryController.text =
                            _newCategoryNameController.text;
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Guardar'),
                  ),
                ],
              );
            },
          ),
    );
  }

  // Selector de icono
  Widget _buildIconSelector(
    BuildContext context,
    StateSetter setState,
    IconNotifier iconNotifier,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Icono Seleccionado',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        if (iconNotifier.selectedIcon != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: FaIcon(
              iconNotifier.selectedIcon,
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
        InkWell(
          onTap: () => setState(() => _isIconExpanded = !_isIconExpanded),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.surface),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const FaIcon(FontAwesomeIcons.icons),
                const SizedBox(width: 12),
                const Text('Seleccionar Icono'),
                const Spacer(),
                Icon(
                  _isIconExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),
        if (_isIconExpanded)
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.surface),
              borderRadius: BorderRadius.circular(8),
            ),
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: iconNotifier.availableIcons.length,
              itemBuilder: (context, index) {
                final icon = iconNotifier.availableIcons[index];
                return GestureDetector(
                  onTap: () {
                    iconNotifier.selectIcon(icon);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          iconNotifier.selectedIcon == icon
                              ? Theme.of(context).primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: FaIcon(
                        icon,
                        color:
                            iconNotifier.selectedIcon == icon
                                ? Theme.of(context).primaryColor
                                : AppColors.grayIcons,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  // Validar formulario de categoría
  bool _validateCategoryForm(IconNotifier iconNotifier) {
    if (_newCategoryNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingresa un nombre para la categoría')),
      );
      return false;
    }

    if (_newCategoryColorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingresa un color para la categoría')),
      );
      return false;
    }

    if (iconNotifier.selectedIcon == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona un icono para la categoría')),
      );
      return false;
    }

    return true;
  }

  // Guardar gasto
  void _saveExpense() {
    if (_expenseController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Ingresa una cantidad')));
      return;
    }

    Navigator.pop(context);
  }
}
