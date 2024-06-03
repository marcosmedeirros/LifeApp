import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;

class GoogleCalendarService {
  static const _scopes = [calendar.CalendarApi.calendarScope];

  static Future<AutoRefreshingAuthClient> getClient() async {
    final credentials = ServiceAccountCredentials.fromJson({
      // Adicione suas credenciais aqui
    });
    return await clientViaServiceAccount(credentials, _scopes);
  }

  static Future<void> addEvent(String summary, DateTime startDate, DateTime endDate) async {
    final client = await getClient();
    final calendarApi = calendar.CalendarApi(client);
    final calendarId = 'primary'; // ID do calendário principal

    final event = calendar.Event();




    await calendarApi.events.insert(event, calendarId);
  }
}
