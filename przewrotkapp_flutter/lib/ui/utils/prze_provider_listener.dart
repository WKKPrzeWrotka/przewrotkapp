import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PrzeProviderListener<T> extends StatefulWidget {
  final void Function(T newValue) listener;
  final Widget child;

  /// Dummy widget that listens to provider and launches [listener] on new values
  const PrzeProviderListener({
    super.key,
    required this.listener,
    required this.child,
  });

  @override
  State<PrzeProviderListener<T>> createState() =>
      _PrzeProviderListenerState<T>();
}

class _PrzeProviderListenerState<T> extends State<PrzeProviderListener<T>> {
  @override
  Widget build(BuildContext context) {
    final value = context.watch<T>();
    widget.listener(value);
    return widget.child;
  }
}
