//IN THIS I LEARNT HOW TO CONNECT GOOGLE SHEET API WITH FLUTTER AND HOW TO FETCH IT AND USE IT FOR DATABASE

import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

//create credentials
const _credentials = r'''
{
 "type": "service_account",
  "project_id": "flutter-gsheets-389013",
  "private_key_id": "431b1c08c81aeadec5cbaf0573182df439b03176",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCw75LkfWl3l6jj\nRg5anDxuQt+TicZBs6DxLimgxXJSBE0Kimc9c18PdpSs2+hT7QwXJx39je3hYAo3\nMNkTjPWr5+4uH7QMr2+pUtZYbjTq8qDopjYokXV/ARbJzfSAOFRpRBWw0ITINv5q\n3G0ujgKSegELPXYc+lZvgvLOm+nlUWL8lGSo19Ht+aAD6ul4FGtqMx1ZLGsVXHMF\niAQVxkN9u5CNqJNK6I5gBQia+zYe9+66rDg9LjI1ycn+W//yApgPNRmwbLv5OQx5\nDcpStEv7vTr5C1N6EYqtLoQHzNFS3AFVjgsCCNaug7e9QdMOrS52cEP+c9XdMsOi\nG2ikAJNFAgMBAAECggEARNtPJqWZxEVcn+n1DxUrPVvAB3pAEfSWZxWodJ0yYrGy\ny63WBKef8HQc4vKHxRWEtYPvG2w/DYzjHNxhNkcOmnJdkkybNK6XfWUz7mEhLefz\nb+azP/FvsNfbJvkENFv3mam56UAU1Jf2Rd73jH0OijN5sYafLyLLPYVP+dDaYve0\nzd7TNXE5GXMck0SEcYMMtzBYS2ispzW1C0eCugntCpBASPsBhb7YZBEPUB8WO3ft\nX5wugLHhsDwAGw3vW1jGGZ8N7mm4Sp6VQvMcuns5gBVWVQIldccdq4hyALpzqFML\n2C8AcsEWCB42LcGC34pqpOISlnl1Nnh6M8SXbEQx5wKBgQDyKIqMegh3uddBfUMK\n94soYxF1zBGg+YNZj4VWgnvs/kGXoiUSbHIxB+4ZLsJ28s3ULwvXo4jwmQPBQXYf\nyGZMquzxsavLxwnGL0HTJhylLYbNrZAU8UFjrniZrga5x6iy5QbDp8g2BZuBarOo\nbeHoUd6OzTHaIjE8WLz1i+jRTwKBgQC7DKSw+pscr/vyFnI7YNaHHU22yl5V+gnP\nAiSGM/aW9Bk87SWZGhTCV3zjA794h0cbxQUghwMeG9nKF/joUz6ZuuIlKO3y+l9q\nU89zpcjzX4GZI9QmuKp1DLYw7BXGfl7aJ0loFkxxnLv203BxwL7OPhjkcr8g2Dus\nc+orPMslKwKBgFT9B4s/9SLX9YVFijcaJBvbkTAvm+xMRd4z8c8n4oiNv8WRIcOy\nje1JZDYwZA3NL5INpPFcst4GRfwYlnWXJtg3kQtOmQXe6D5HLaoGkT0jmlErXgsL\nlTB/9lGxcyjWuw12NgaLJ0hWdXpZUY6GaifYO+0QdTOilncgicj//okfAoGAUZ2u\nrtpqnBXd5UAOEAKtGL+cjUm35+P2K7FPpo895ZgU+xSu9yL+M95gy91yynCcgm1x\nU0QWBCk62oejQBwykHmO+4/kY8UDpS10s41/JVJjBiMwCsVA+1nUlXwt9DJnyOCj\nkxtHt7sf+Q9BXSExIGTQD75Rz08KmrDpWHxqV4kCgYAHk5pnTvzoQBb8fbAxjrK1\na9znF/fJu7OHEQFeHFFcJWYZUNbBW0sKKbfEujvEJD/H1qvPpsPs2ZJ1WvRtjEPH\ngoNW9baKTYFCdjZltmf76rwpSzKWCNjHGKmGdSclMuL0uP/olQc4f3ppHLppN0tt\n6+W8qUqw1yJRe4g2sWVIXQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets@flutter-gsheets-389013.iam.gserviceaccount.com",
  "client_id": "105685282364273371302",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets%40flutter-gsheets-389013.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';

//spreadsheet id
const _spreadsheetId = '1Qt_XWCyXldm_utIKNmjM1MXfzFIs_1NpkSU1b9GE_ss';

void main() async {
  //initialising Gsheets
  final gsheets = GSheets(_credentials);

  //fetching spreadsheets by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId);

  //get worksheet by its title
  var sheet = ss.worksheetByTitle('Hello1');

  //upadatig a cell
  await sheet!.values.insertValue('Manish', column: 1, row: 1);

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
