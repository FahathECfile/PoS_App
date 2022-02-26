import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class PurchaseForms {
  String _pSupplier = "";
  String _pInvoice = "";
  DateTime _pDate;
  // String _pdate ="";
  String _pItemName = "";
  String _pItemNo = "";
  String _pPrice = "";
  String _pQty = "";

  PurchaseForms(this._pSupplier, this._pInvoice, this._pDate, this._pItemName,
      this._pItemNo, this._pPrice, this._pQty);

  PurchaseForms.empty();

  String get pSupplier => _pSupplier;
  String get pInvoice => _pInvoice;
  DateTime get pDate => _pDate;
  String get pItemName => _pItemName;
  String get pItemNo => _pItemNo;
  String get pPrice => _pPrice;
  String get pQty => _pQty;

  @override
  String toString() {
    return 'PurchaseForms{_pSupplier: $_pSupplier, _pInvoice: $_pInvoice, _date: $_pDate, _pItemName: $_pItemName, _pItemNo: $_pItemNo, _pPrice: $_pPrice, _pQty:$_pQty}';
  }
}

class PurchaseFormIn extends StatefulWidget {
  PurchaseForms _address = PurchaseForms.empty();

  PurchaseFormIn({Key key}) : super(key: key);

  @override
  _PurchaseFormInState createState() => _PurchaseFormInState(_address);
}

class _PurchaseFormInState extends State<PurchaseFormIn> {
  PurchaseForms _address;

  _PurchaseFormInState(_address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Please Enter Purchase Details "),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: AddressWidget(address: _address, onSaved: _onSaved),
            )
          ],
        ),
      ),
    );
  }

  _onSaved(PurchaseForms address) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Address'),
          content: Text(address.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class AddressWidget extends StatefulWidget {
  PurchaseForms _address;
  ValueChanged<PurchaseForms> _onSaved;

  AddressWidget(
      {Key key, PurchaseForms address, ValueChanged<PurchaseForms> onSaved})
      : super(key: key) {
    this._address = address;
    this._onSaved = onSaved;
  }
  @override
  _AddressWidgetState createState() => _AddressWidgetState(_address);
}

class _AddressWidgetState extends State<AddressWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _suplierTextController;
  TextEditingController _purchaseInvoiceTextController;

  TextEditingController _pNameTextController;
  TextEditingController _codeTextController;
  TextEditingController _priceTextController;
  TextEditingController _qtyTextController;
  DateFormat _dateFormat = DateFormat("dd/MM/yyyy");
  TextEditingController _pDateTextController;

  _AddressWidgetState(PurchaseForms address) {
    _suplierTextController = TextEditingController(text: address.pSupplier);
    _purchaseInvoiceTextController =
        TextEditingController(text: address.pInvoice);
    _pNameTextController = TextEditingController(text: address.pItemName);
    _codeTextController = TextEditingController(text: address.pItemNo);
    _priceTextController = TextEditingController(text: address.pPrice);
    _qtyTextController = TextEditingController(text: address.pQty);
    _pDateTextController = TextEditingController(
        text: address.pDate != null ? _dateFormat.format(address.pDate) : "");
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formWidgetList = [];
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Supplier',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
