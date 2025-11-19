import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _expression = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";
  bool _isScientificMode = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _expression = "";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      } else if (buttonText == "⌫") {
        if (_output.isNotEmpty && _output != "0") {
          _output = _output.substring(0, _output.length - 1);
          if (_output.isEmpty) _output = "0";
        }
      } else if (buttonText == "=") {
        if (_operand.isNotEmpty) {
          try {
            _num2 = double.parse(_output);
            _expression = "$_num1 $_operand $_num2";

            switch (_operand) {
              case "+":
                _output = (_num1 + _num2).toString();
                break;
              case "-":
                _output = (_num1 - _num2).toString();
                break;
              case "×":
                _output = (_num1 * _num2).toString();
                break;
              case "÷":
                _output = (_num2 != 0) ? (_num1 / _num2).toStringAsFixed(6) : "Error";
                break;
              case "^":
                _output = pow(_num1, _num2).toString();
                break;
            }
            _num1 = 0;
            _num2 = 0;
            _operand = "";
          } catch (e) {
            _output = "Error";
          }
        }
      } else if (["+", "-", "×", "÷", "^"].contains(buttonText)) {
        try {
          _num1 = double.parse(_output);
          _operand = buttonText;
          _output = "0";
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "±") {
        try {
          _output = (-double.parse(_output)).toString();
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == ".") {
        if (!_output.contains(".")) {
          _output += ".";
        }
      } else if (buttonText == "sin") {
        try {
          double value = double.parse(_output);
          _output = sin(value * pi / 180).toStringAsFixed(6);
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "cos") {
        try {
          double value = double.parse(_output);
          _output = cos(value * pi / 180).toStringAsFixed(6);
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "tan") {
        try {
          double value = double.parse(_output);
          _output = tan(value * pi / 180).toStringAsFixed(6);
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "log") {
        try {
          double value = double.parse(_output);
          _output = (log(value) / ln10).toStringAsFixed(6);
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "ln") {
        try {
          double value = double.parse(_output);
          _output = log(value).toStringAsFixed(6);
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "√") {
        try {
          double value = double.parse(_output);
          _output = (value >= 0) ? sqrt(value).toStringAsFixed(6) : "Error";
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "π") {
        _output = pi.toString();
      } else if (buttonText == "e") {
        _output = e.toString();
      } else if (buttonText == "x²") {
        try {
          double value = double.parse(_output);
          _output = pow(value, 2).toString();
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "x!") {
        try {
          int value = int.parse(_output);
          if (value >= 0 && value <= 20) {
            _output = _factorial(value).toString();
          } else {
            _output = "Error";
          }
        } catch (e) {
          _output = "Error";
        }
      } else {
        if (_output == "0" || _output == "Error") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  int _factorial(int n) {
    if (n == 0 || n == 1) return 1;
    return n * _factorial(n - 1);
  }

  Widget _buildButton(String buttonText, {Color? backgroundColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CM Scientific Calculator'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(_isScientificMode ? Icons.calculate : Icons.science),
            onPressed: () {
              setState(() {
                _isScientificMode = !_isScientificMode;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: const TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _output,
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          if (_isScientificMode) ...[
            Row(
              children: [
                _buildButton("sin", backgroundColor: Colors.orange),
                _buildButton("cos", backgroundColor: Colors.orange),
                _buildButton("tan", backgroundColor: Colors.orange),
                _buildButton("π", backgroundColor: Colors.orange),
                _buildButton("e", backgroundColor: Colors.orange),
              ],
            ),
            Row(
              children: [
                _buildButton("log", backgroundColor: Colors.orange),
                _buildButton("ln", backgroundColor: Colors.orange),
                _buildButton("√", backgroundColor: Colors.orange),
                _buildButton("x²", backgroundColor: Colors.orange),
                _buildButton("x!", backgroundColor: Colors.orange),
              ],
            ),
          ],
          Row(
            children: [
              _buildButton("C", backgroundColor: Colors.red),
              _buildButton("⌫", backgroundColor: Colors.red),
              _buildButton("±", backgroundColor: Colors.blue),
              _buildButton("÷", backgroundColor: Colors.blue),
              _buildButton("^", backgroundColor: Colors.blue),
            ],
          ),
          Row(
            children: [
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("×", backgroundColor: Colors.blue),
              _buildButton("%", backgroundColor: Colors.blue),
            ],
          ),
          Row(
            children: [
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("-", backgroundColor: Colors.blue),
              _buildButton("(", backgroundColor: Colors.blue),
            ],
          ),
          Row(
            children: [
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("+", backgroundColor: Colors.blue),
              _buildButton(")", backgroundColor: Colors.blue),
            ],
          ),
          Row(
            children: [
              _buildButton("0"),
              _buildButton("."),
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(2),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => _buttonPressed("="),
                    child: const Text(
                      "=",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}