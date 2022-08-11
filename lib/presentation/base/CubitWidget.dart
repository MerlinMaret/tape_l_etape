import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitWidgetState<CubitEntity extends Cubit<CubitState>,
    CubitState, W extends StatefulWidget> extends State<W> {
  late CubitEntity cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CubitEntity>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitEntity, CubitState>(
      builder: (context, state) {
        return buildWidget(context, state);
      },
    );
  }

  Widget buildWidget(BuildContext context, CubitState state);
}
