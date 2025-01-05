import 'package:flutter/material.dart';
import 'package:flutter_crise/components/button.component.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class DayNightPickerPage extends StatefulWidget {
  const DayNightPickerPage({super.key});

  @override
  State<DayNightPickerPage> createState() => _DayNightPickerPageState();
}

class _DayNightPickerPageState extends State<DayNightPickerPage> {
  Time time = Time(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    TextComponent(
                      value: 'Que horas',
                      fontWeight: FontWeight.w700,
                      fontSize: 60,
                      height: 1.0,
                    ),
                    TextComponent(
                      value: 'deseja acordar?',
                      fontWeight: FontWeight.w700,
                      fontSize: 60,
                      height: 1.0,
                    ),
                    const SizedBox(height: 20),
                    TextComponent(
                        value: 'Selecione o horário desejado para despertar',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent(
                          value: '${time.hour}:${time.minute}',
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                        ),
                        ButtonIconCircularComponent(
                          fillColor: Colors.yellow,
                          iconColor: Colors.black,
                          iconData: Icons.access_alarm,
                          onPressed: () {
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                cancelText: 'Voltar',
                                okText: 'Continuar',
                                accentColor: Theme.of(context).primaryColor,
                                value: time,
                                sunrise:
                                    TimeOfDay(hour: 6, minute: 0), // optional
                                sunset:
                                    TimeOfDay(hour: 18, minute: 0), // optional
                                duskSpanInMinutes: 120, // optional
                                onChange: (value) {
                                  time = value;
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Expanded(
                            child: ButtonStylizedComponent(
                          borderRadius: 34,
                          padding: EdgeInsets.all(16),
                          label: TextComponent(
                              value: 'SALVAR',
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 18),
                          onPressed: () {},
                        ))
                      ],
                    ),
                    const SizedBox(height: 22),
                  ],
                ))));
  }
}
