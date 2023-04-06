import 'package:gunluk_burc/model/datas.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

import 'dart:convert';

class web {
  Future<List<PlanetInfo>?> fetchburc() async {
    List astrology = [
      "aries",
      "taurus",
      "gemini",
      "cancer",
      "leo",
      "virgo",
      "libra",
      "scorpio",
      "sagittarius",
      "capricorn",
      "aquarius",
      "pisces"
    ];
    List descrips = [];

    List dating = [];

    List<PlanetInfo> planets;
    try {
      //günlük burc yorumu
      for (var i = 0; i < astrology.length; i++) {
        final url = Uri.parse(
            "https://www.astrology.com/horoscope/daily/${astrology[i]}.html");
        final response = await http.get(url);
        dom.Document html = dom.Document.html(response.body);
        final descrip = html
            .querySelectorAll("#content > p > span")
            .map((e) => e.innerHtml.trim());
        String burcdes = descrip.toString();
        burcdes = burcdes.substring(1, burcdes.length - 1);
        descrips.add(burcdes);
      }
      //günlük aşk yorumu

      //günlük date yorumu
      for (var i = 0; i < astrology.length; i++) {
        final url = Uri.parse(
            "https://www.astrology.com/horoscope/daily-dating/${astrology[i]}.html");
        final response = await http.get(url);
        dom.Document html = dom.Document.html(response.body);
        final descrip =
            html.querySelectorAll("#content").map((e) => e.innerHtml.trim());
        String burcdes = descrip.toString();
        burcdes = burcdes.substring(1, burcdes.length - 1);
        dating.add(burcdes);
      }

      return planets = [
        PlanetInfo("March 21 - April 19",
            name: 'Aries',
            iconImage: 'assets/aries.png',
            description: descrips[0],
            images: [
              dating[0],
            ]),
        PlanetInfo("April 20 - May 20",
            name: 'Taurus',
            iconImage: 'assets/taurus.png',
            description: descrips[1],
            images: [
              dating[1],
            ]),
        PlanetInfo("May 21 - June 21",
            name: 'Gemini',
            iconImage: 'assets/gemini.png',
            description: descrips[2],
            images: [
              dating[2],
            ]),
        PlanetInfo("June 22 - July 22",
            name: 'Cancer',
            iconImage: 'assets/cancer.png',
            description: descrips[3],
            images: [
              dating[3],
            ]),
        PlanetInfo("July 23 - August 22",
            name: 'Leo',
            iconImage: 'assets/leo.png',
            description: descrips[4],
            images: [
              dating[4],
            ]),
        PlanetInfo("August 23 - September 22",
            name: 'Virgo',
            iconImage: 'assets/virgo.png',
            description: descrips[5],
            images: [
              dating[5],
            ]),
        PlanetInfo("September 23 - October 22",
            name: 'Libra',
            iconImage: 'assets/libra.png',
            description: descrips[6],
            images: [
              dating[6],
            ]),
        PlanetInfo(
          "October 23 - November 21",
          name: 'Scorpio',
          iconImage: 'assets/scorpio.png',
          description: descrips[7],
          images: [
            dating[7],
          ],
        ),
        PlanetInfo(
          "November 22 - December 21",
          name: 'Archer',
          iconImage: 'assets/sagittarius.png',
          description: descrips[8],
          images: [
            dating[8],
          ],
        ),
        PlanetInfo(
          "December 22 - January 19",
          name: 'Capricorn',
          iconImage: 'assets/capricorn.png',
          description: descrips[9],
          images: [
            dating[9],
          ],
        ),
        PlanetInfo(
          "January 20 - February 18",
          name: 'Aquarius',
          iconImage: 'assets/aquarius.png',
          description: descrips[10],
          images: [
            dating[10],
          ],
        ),
        PlanetInfo(
          "February 19 - March 20",
          name: 'Pisces',
          iconImage: 'assets/pisces.png',
          description: descrips[11],
          images: [
            dating[11],
          ],
        ),
      ];
    } on Exception catch (e) {
      // TODO
    }
  }
}
