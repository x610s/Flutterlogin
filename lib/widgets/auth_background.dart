import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget hijo;
  const AuthBackground({super.key, required this.hijo});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Stack( 
          children:  [
            const _PupleBox(),
            const  _IconHeader(),
             hijo
          ],
      ),
    );
  }
}

class _IconHeader extends StatelessWidget {
  const _IconHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
       Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 40),
        child: const Icon( Icons.person_pin, color: Colors.white, size: 100 ),
      )
    );
  }
}

class _PupleBox extends StatelessWidget {
  const _PupleBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.indigo,
        Colors.deepPurple,
      ])),
    );
  }
}
