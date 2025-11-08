import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _currentInput = '';
  String _operator = '';
  double _firstOperand = 0;
  bool _shouldResetDisplay = false;

  void _onNumberPressed(String number) {
    setState(() {
      if (_shouldResetDisplay || _display == '0') {
        _display = number;
        _shouldResetDisplay = false;
      } else {
        _display += number;
      }
      _currentInput = _display;
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      if (_currentInput.isNotEmpty) {
        _firstOperand = double.parse(_currentInput);
      }
      _operator = operator;
      _shouldResetDisplay = true;
    });
  }

  void _onEqualsPressed() {
    if (_operator.isEmpty || _currentInput.isEmpty) return;

    setState(() {
      double secondOperand = double.parse(_currentInput);
      double result = 0;

      switch (_operator) {
        case '+':
          result = _firstOperand + secondOperand;
          break;
        case '-':
          result = _firstOperand - secondOperand;
          break;
        case '×':
          result = _firstOperand * secondOperand;
          break;
        case '÷':
          if (secondOperand != 0) {
            result = _firstOperand / secondOperand;
          } else {
            _display = 'Error';
            _clear();
            return;
          }
          break;
      }

      _display = _formatResult(result);
      _currentInput = _display;
      _operator = '';
      _shouldResetDisplay = true;
    });
  }

  void _onSpecialOperatorPressed(String operator) {
    if (_currentInput.isEmpty) return;

    setState(() {
      double value = double.parse(_currentInput);
      double result = 0;

      switch (operator) {
        case 'x²':
          result = value * value;
          break;
        case '√':
          if (value >= 0) {
            result = sqrt(value);
          } else {
            _display = 'Error';
            _clear();
            return;
          }
          break;
      }

      _display = _formatResult(result);
      _currentInput = _display;
      _shouldResetDisplay = true;
    });
  }

  String _formatResult(double result) {
    if (result == result.toInt()) {
      return result.toInt().toString();
    } else {
      return result.toStringAsFixed(2);
    }
  }

  void _clear() {
    setState(() {
      _display = '0';
      _currentInput = '';
      _operator = '';
      _firstOperand = 0;
      _shouldResetDisplay = false;
    });
  }

  void _onDecimalPressed() {
    setState(() {
      if (_shouldResetDisplay) {
        _display = '0.';
        _shouldResetDisplay = false;
      } else if (!_display.contains('.')) {
        _display += '.';
      }
      _currentInput = _display;
    });
  }

  void _onBackspacePressed() {
    setState(() {
      if (_display.length > 1) {
        _display = _display.substring(0, _display.length - 1);
        _currentInput = _display;
      } else {
        _display = '0';
        _currentInput = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.teal.shade700, Colors.teal.shade500],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kalkulator',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.calculate,
                        color: Colors.white.withOpacity(0.7),
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Display
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (_operator.isNotEmpty)
                          Text(
                            '$_firstOperand $_operator',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        const SizedBox(height: 8),
                        Text(
                          _display,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Calculator Buttons
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Row 1: Special operations
                    Row(
                      children: [
                        _buildButton('C', isSpecial: true, onPressed: _clear),
                        _buildButton(
                          '⌫',
                          isSpecial: true,
                          onPressed: _onBackspacePressed,
                        ),
                        _buildButton(
                          'x²',
                          isOperator: true,
                          onPressed: () => _onSpecialOperatorPressed('x²'),
                        ),
                        _buildButton(
                          '√',
                          isOperator: true,
                          onPressed: () => _onSpecialOperatorPressed('√'),
                        ),
                      ],
                    ),

                    // Row 2
                    Row(
                      children: [
                        _buildButton(
                          '7',
                          onPressed: () => _onNumberPressed('7'),
                        ),
                        _buildButton(
                          '8',
                          onPressed: () => _onNumberPressed('8'),
                        ),
                        _buildButton(
                          '9',
                          onPressed: () => _onNumberPressed('9'),
                        ),
                        _buildButton(
                          '÷',
                          isOperator: true,
                          onPressed: () => _onOperatorPressed('÷'),
                        ),
                      ],
                    ),

                    // Row 3
                    Row(
                      children: [
                        _buildButton(
                          '4',
                          onPressed: () => _onNumberPressed('4'),
                        ),
                        _buildButton(
                          '5',
                          onPressed: () => _onNumberPressed('5'),
                        ),
                        _buildButton(
                          '6',
                          onPressed: () => _onNumberPressed('6'),
                        ),
                        _buildButton(
                          '×',
                          isOperator: true,
                          onPressed: () => _onOperatorPressed('×'),
                        ),
                      ],
                    ),

                    // Row 4
                    Row(
                      children: [
                        _buildButton(
                          '1',
                          onPressed: () => _onNumberPressed('1'),
                        ),
                        _buildButton(
                          '2',
                          onPressed: () => _onNumberPressed('2'),
                        ),
                        _buildButton(
                          '3',
                          onPressed: () => _onNumberPressed('3'),
                        ),
                        _buildButton(
                          '-',
                          isOperator: true,
                          onPressed: () => _onOperatorPressed('-'),
                        ),
                      ],
                    ),

                    // Row 5
                    Row(
                      children: [
                        _buildButton(
                          '0',
                          onPressed: () => _onNumberPressed('0'),
                        ),
                        _buildButton('.', onPressed: _onDecimalPressed),
                        _buildButton(
                          '=',
                          isEquals: true,
                          onPressed: _onEqualsPressed,
                        ),
                        _buildButton(
                          '+',
                          isOperator: true,
                          onPressed: () => _onOperatorPressed('+'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    String label, {
    bool isOperator = false,
    bool isEquals = false,
    bool isSpecial = false,
    required VoidCallback onPressed,
  }) {
    Color backgroundColor;
    Color textColor;

    if (isEquals) {
      backgroundColor = Colors.teal.shade600;
      textColor = Colors.white;
    } else if (isOperator) {
      backgroundColor = Colors.orange.shade500;
      textColor = Colors.white;
    } else if (isSpecial) {
      backgroundColor = Colors.grey.shade300;
      textColor = Colors.black87;
    } else {
      backgroundColor = Colors.white;
      textColor = Colors.black87;
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          elevation: 4,
          shadowColor: backgroundColor.withOpacity(0.4),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isOperator || isEquals
                      ? backgroundColor.withOpacity(0.5)
                      : Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: label == '⌫' ? 24 : 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
