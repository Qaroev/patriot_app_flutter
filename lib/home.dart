import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patriotapp/bloc/status_bloc.dart';
import 'package:patriotapp/models/status.dart';
import 'package:patriotapp/utils/date.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  loadStatus() async {
    context.read<StatusBloc>().add(StatusEvents.fetchStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: true,
        body: BlocBuilder<StatusBloc, StatusState>(
            builder: (BuildContext contex, StatusState state) {
          if (state is StatusListErrorstate) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return Text(
              message,
            );
          }
          if (state is StatusLoadedState) {
            List<Status> status = state.status;
            return body(status);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }

  body(List<Status> status) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kBottomNavigationBarHeight, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Статус охраны',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            status.isNotEmpty
                ? cards(
                    color: const Color.fromRGBO(73, 147, 86, 0.3),
                    image: status[0].event_type == 'arm'
                        ? 'assets/images/image-4.png'
                        : status[0].event_type == 'alarm'
                            ? 'assets/images/image-3.png'
                            : 'assets/images/image-3.png',
                    text1:
                        '${DateTime.parse(status[0].event_date).isToday() ? 'Сегодня' : getDate(status[0].event_date)}',
                    text2: status[0].event_name,
                    text3: status[0].event_description,
                    text4: 'Восточная, 32 • Объект ${status[0].object_id}',
                  )
                : Container(),
            const SizedBox(height: 40),
            const Text(
              'История статусов',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 27),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...status.map((Status it) {
                  return Column(
                    children: [
                      getHistoryCard(it),
                      const SizedBox(height: 15),
                    ],
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }

  getHistoryCard(it) {
    return ListTile(
      leading: Image.asset(
        it.event_type == 'arm'
            ? 'assets/images/image-4.png'
            : it.event_type == 'alarm'
                ? 'assets/images/image-3.png'
                : 'assets/images/image-3.png',
        width: 27,
        height: 27,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${it.event_name}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 9),
          Text('${it.event_description}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 5),
          Text('Восточная, 32 • Объект ${it.object_id}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
      trailing: Text(
          '${DateTime.parse(it.event_date).isToday() ? 'Сегодня' : getDate(it.event_date)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  cards({color, image, text1, text2, text3, text4}) {
    return Container(
      width: double.infinity,
      height: 185,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(14))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 17),
                    Text(
                      text2,
                      style: const TextStyle(
                        color: Color.fromRGBO(98, 173, 111, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      text3,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Image.asset(image),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 0.5,
              color: Colors.grey,
            ),
            const SizedBox(height: 13),
            Text(
              text4,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
