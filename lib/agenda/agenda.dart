import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/agendaProvider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Agenda extends StatefulWidget {
  Agenda({Key key}) : super(key: key);

  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  static FocusNode foco0 = FocusNode();
  static Map<String,dynamic> usuarioVendedor = {
  "label":"Agenda Atual",
  "selecionada":"Minha Agenda",
  "itens":["Minha Agenda","opcao 1","opcao 2"],
  'tipo':'dropdown',
  "foco0":foco0
};
CalendarController _calendarController = CalendarController();
 List _selectedEvents = [];
 DateTime diaSelecionado;
  Map<DateTime, List> _events;
final Map<DateTime, List> _holidays = {
  

};
 void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    print("EVENTOS DO DIA $events , dia $day");
    setState(() {
      _selectedEvents = events;
      diaSelecionado = day;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }
   Widget _buildEventList() {
    return ListView(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(event['titulo']),
                      Text(event['descricao']),
                      (event['horario'] != null) ? Text(event['horario']) : Padding(padding: EdgeInsets.all(0))
                    ],
                  ),
                   
                  onTap: () => Navigator.of(context).pushNamed('/TarefaAgendada'),
                ),
              ))
          .toList(),
    );
  }
Widget _buildTableCalendar(Map<DateTime,List> novosEventos) {
    return TableCalendar(
      locale:'pt_Br',
      calendarController: _calendarController,
      events: novosEventos,
      holidays: _holidays,      
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }
iniciarAgenda(){
   Provider.of<AgendaProviderState>(context, listen: false).getListaEventos();
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniciarAgenda();
     final _selectedDay = DateTime.now();
     final doisSelectedDay = DateTime.now();
    _calendarController = CalendarController();
   
      
  }
@override
  void dispose() {
    // TODO: implement dispose
    _calendarController = CalendarController();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final agendaProvider = Provider.of<AgendaProviderState>(context);
     final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Minha Agenda"),
      ),
      body:ListView(
        padding: EdgeInsets.all(10),
        
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              (diaSelecionado == null) ? Text("Dia Selecionado") : Text("Tarefa Para ${diaSelecionado.day}/${diaSelecionado.month}/${diaSelecionado.year}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Row(              
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    print("FUNÇÃO ADICIONAR AGENDA");
                    if(diaSelecionado != null){
                      agendaProvider.adicionarEventoDialog(context, diaSelecionado);
                    }else{
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Escolha uma data")));
                    }
                  },
                  color: Colors.blue[400],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.add,color:Colors.white),
                      Text("Adicionar" , style:TextStyle(color:Colors.white))
                    ],
                  ),
                  ),
                 
                  
              ],
            )

            ],
          )
            ,
        
        
         
         (agendaProvider.eventosUsuarioMap != null) ? _buildTableCalendar(agendaProvider.eventosUsuarioMap) : Center(
           child: SizedBox(
             height: 50,
             width: 50,
             child: CircularProgressIndicator(),
           ),
         ),
          Expanded(child: _buildEventList()),
      


        ],
      )
    );
  }
}