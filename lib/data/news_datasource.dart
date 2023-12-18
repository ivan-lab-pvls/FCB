class NewsDatasource {
  static final List<SportNew> allNews = [
    ...hockeyNews,
    ...basketballNews,
    ...footballNews,
  ];
  static final List<SportNew> footballNews = [
    SportNew(
      newTitle:
          "The 7-0 defeat was meant to be Manchester United's lowest ebb, but United return to Anfield on Sunday in yet another crisis after crashing out of Europe on Tuesday with a whimper and losing to Bournemouth at Old Trafford last weekend.",
      newText:
          "Meanwhile, Liverpool are buoyant. Jurgen Klopp's side head into the weekend top of the table, arguably ahead of schedule - given their extensive midfield reboot in the summer, but with growing hopes of a title challenge.\n\nIt's easy to forget the Reds finished eight points behind United last season. What's happened? The problems at Old Trafford are too numerous to list here, but we can focus on one thing: goals.",
      newDate: DateTime(2023, 12, 14),
      newImage:
          "https://e0.365dm.com/23/12/2048x1152/skysports-graphic-premier-league_6392532.jpg?20231214083731",
    ),
    SportNew(
      newTitle:
          "Manchester City’s recent Premier League slump is giving the rest a chance to dream Max Rushden",
      newText:
          "It’s May 19th 2024. You’ve got Liverpool v Wolves on the big telly, you’ve wheeled in the small, very old, one from the bedroom for Man City v West Ham, Arsenal v Everton is on the iPad, Graham Potter’s Palace (fresh from his bruising 44-day stint at Manchester United) v Villa is on your phone and Sheffield United v Spurs is on the radio. All five could still win the title. It’s unprecedented. Sean Dyche’s Everton could still get into Europe with a win at the Emirates.",
      newDate: DateTime(2023, 12, 14),
      newImage:
          "https://i.guim.co.uk/img/media/8776a73515e223421410d82c53618e39f978e5f4/0_203_5358_3215/master/5358.jpg?width=1020&dpr=2&s=none",
    ),
    SportNew(
      newTitle:
          "Newcastle left to rue lost opportunity after agonising exit from Europe",
      newText:
          "They’ll always have Paris. They’ll have the glorious memories of hammering Paris Saint-Germain 4-1 at home, but Newcastle will also have the fury and frustration of the injury-time penalty at the Parc des Princes two weeks ago. It was that decision, a cross flicking off Tino Livramento’s torso and on to his arm as he chased back, that they will feel, far more than defeat by Milan, eliminated them from Europe.\n\nIn time, perhaps, there will be a feeling that a slender squad will benefit from the free midweeks later in the season. In the long run, in terms of qualifying for next season’s Champions League, which will be essential for attracting the highest tier of talent to the club, this may be for the best. But it will be a while before the disappointment fades, and the sense of being cheated.",
      newDate: DateTime(2023, 12, 13),
      newImage:
          "https://i.guim.co.uk/img/media/e3e0ecf8e2507e54c5723bc2f43d49173062589c/0_0_5000_3000/master/5000.jpg?width=1300&dpr=2&s=none",
    ),
    SportNew(
      newTitle:
          "‘Not in a great place’: Emma Hayes laments treatment of Lauren James",
      newText:
          "Emma Hayes has revealed Lauren James “is not in a very good place” after receiving racist abuse on social media and compared the Chelsea forward’s treatment to that of David Beckham after his red card during the 1998 men’s World Cup.\n\nJames, who was suspended for two matches at the Women’s World Cup in the summer after being sent off for stamping on Nigeria’s Michelle Alozie, has been targeted online since a similar incident during Chelsea’s 4-1 defeat at Arsenal on Sunday. She was booked for appearing to stamp on Lia Wälti and substituted by Hayes minutes later.",
      newDate: DateTime(2023, 12, 13),
      newImage:
          "https://i.guim.co.uk/img/media/de4e67dc101304c0f3d14e778e00e7a1b8502159/0_105_4711_2826/master/4711.jpg?width=620&dpr=2&s=none",
    ),
    SportNew(
      newTitle:
          "‘Many think football is not a game for women’: why Egypt is falling behind",
      newText:
          "The huge gulf between women’s and men’s football in Egypt – the most populous country in north Africa and the wider Arab world – can be measured by their sharply contrasting fortunes at the Africa Cup of Nations (Afcon) and Women’s Africa Cup of Nations (Wafcon) – the continent’s top two national team tournaments.\n\nWhile Egypt’s Pharaohs, record winners of the Afcon will be seeking an unprecedented eighth title in Ivory Coast in January, their female counterparts, the Cleopatras, managed by Mohamed Kamala and captained by Maha Al-Demerdash, failed to qualify for Morocco 2024, losing 4-0 on aggregate to Senegal in the final round of qualifying last week.",
      newDate: DateTime(2023, 12, 12),
      newImage:
          "https://i.guim.co.uk/img/media/5e955e23fc74e3c46a2c3bde80053420789c7b65/0_100_2048_1228/master/2048.jpg?width=620&dpr=2&s=none",
    ),
  ];
  static final List<SportNew> hockeyNews = [
    SportNew(
      newTitle: "INSTANT REACTION: CANADA'S 2024 WORLD JUNIOR ROSTER",
      newText:
          "Goaltending, a Flyers defense prospect and an undrafted two-way forward are among the notable storylines for Canada's 2024 world juniors roster. Ryan Kennedy gives a video reaction.",
      newDate: DateTime(2023, 12, 14),
      newImage:
          "https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MTk0Mjc4NTA0NDk2NDQxMDA5/bonk_ld_a26p0902.webp",
    ),
    SportNew(
      newTitle: "HOCKEY CANADA FINALIZES 2024 WORLD JUNIOR CHAMPIONSHIP ROSTER",
      newText:
          "The final cuts were made as Team Canada's world juniors selection camp took place over the last few days, including two games against the U Sports All-Stars.\n\nThe 23-man roster will head overseas to Sweden and compete in the 2024 IIHF World Junior Championship and look to defend the gold medal with just one returning player, Owen Beck, featured in The Hockey News' World Juniors magazine issue out now.",
      newDate: DateTime(2023, 12, 13),
      newImage:
          "https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAxNzY5NTM1NzM1MzQyNzM1/celebrinimacklin2425.webp",
    ),
    SportNew(
      newTitle:
          "THN ARCHIVE: IN 1984, GRETZKY TALKED LEGACY, DIVING AND MORE IN-DEPTH INTERVIEW",
      newText:
          "As any and every hockey fan knows, Wayne Gretzky was arguably the best player ever to lace up skates.\n\nIn this exclusive, in-depth interview of Gretzky in THN’s May 4, 1984 edition (Vol. 37, Issue 31), Gretzky provided outstanding insight into the challenges he faced as the biggest star in the NHL and his day-to-day focus on always raising the competitive bar for himself and the Edmonton Oilers.",
      newDate: DateTime(2023, 12, 13),
      newImage:
          "https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAyODg5Mzc2Nzg1NTA3Mzk2/vol37iss31-thn-archive.webp",
    ),
    SportNew(
      newTitle:
          "SCREEN SHOTS: NHL SKILLS COMPETITION, PITTSBURGH PENGUINS, HOCKEY ALBERTA AND HEROS",
      newText:
          "Giving the winner of the eight-stage competition a cool \$1 million is exactly what’s necessary to get elite players invested in the all-star process. It doesn’t matter if the 12 players involved in this new format are the top earners in the NHL, either. They now have the chance to add a whole lot of zeros to their bank account, and that’s the proper motivation that won’t lead to injuries, as it would if the All-Star Game itself was more competitive.",
      newDate: DateTime(2023, 12, 13),
      newImage:
          "https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAyODg4OTk1MzM4NzI0MzY0/usatsi_21898465.webp",
    ),
    SportNew(
      newTitle: "FOUR INTERESTING STORYLINES BEFORE THE NHL'S HOLIDAY BREAK",
      newText:
          "After eight straight wins, their latest coming against the Chicago Blackhawks on Tuesday, a season many thought looked lost midway through November seems alive and well as they currently sit just one point back of a playoff spot. \n\nThe turnaround has been led by who else but one Connor McDavid? He's recorded 22 points in his last eight games. He's had plenty of support offensively. Zach Hyman leads the team in goals with 16, and Leon Draisaitl is top 20 in league scoring.",
      newDate: DateTime(2023, 11, 12),
      newImage:
          "https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAyODg3ODAyOTQ4NDI4ODY4/usatsi_22079187.webp",
    ),
  ];

  static final List<SportNew> basketballNews = [
    SportNew(
      newTitle:
          "In-Season Tourney Championship: Most-watched non-Christmas game since 2018",
      newText:
          "The Los Angeles Lakers' victory over the Indiana Pacers in Saturday's inaugural NBA In-Season Tournament Championship Game from Las Vegas averaged 4,580,000 viewers on ABC and ESPN2, making it the most-watched non-Christmas NBA game during the regular season on any network in nearly six years, since February of 2018, according to Nielsen.\n\nViewership peaked with 5,680,000 viewers at 11 p.m. ET. The average audience was up 46 percent vs. last year’s NBA Saturday Primetime on ABC season debut, which is the comparable window (Boston Celtics vs. Golden State Warriors).",
      newDate: DateTime(2023, 12, 14),
      newImage:
          "https://cdn.basketballnews.com/fit-in/1024x0/filters:strip_exif():filters:quality(95)/images/story/11816/bro22_690w.jpg",
    ),
    SportNew(
      newTitle: "Los Angeles Lakers win NBA's inaugural In-Season Tournament",
      newText:
          "The Los Angeles Lakers are the NBA's inaugural In-Season Tournament champions.\n\nOn Saturday night, the Lakers defeated the Indiana Pacers, 123-109, at the T-Mobile Arena in Las Vegas to earn the NBA Cup and a \$500,000 prize for every player on their roster.\n\nLeBron James was named the In-Season Tournament MVP after contributing 24 points, 11 rebounds, 4 assists and 2 steals, while shooting 47.6% from the field. Anthony Davis dominated in his 41 minutes, finishing with 41 points, 20 rebounds, 5 assists and 4 blocks, while shooting 66.7% from the field. Also, Austin Reaves scored an efficient 28 points in 28 minutes off the bench.",
      newDate: DateTime(2023, 12, 14),
      newImage:
          "https://cdn.basketballnews.com/fit-in/1024x0/filters:strip_exif():filters:quality(95)/images/story/11815/ad55_690w.jpg",
    ),
    SportNew(
      newTitle:
          "NBA and Nike EYBL team up for new showcase at In-Season Tournament",
      newText:
          "The National Basketball Association (NBA) and Nike Elite Youth Basketball League (EYBL) will team up to host the first EYBL Scholastic Showcase, a basketball competition and player development event for six top high school basketball programs that will take place from Dec. 7 through Dec. 9 in Las Vegas as part of the NBA In-Season Tournament Semifinals and Championship weekend.",
      newDate: DateTime(2023, 12, 13),
      newImage:
          "https://cdn.basketballnews.com/fit-in/1024x0/filters:strip_exif():filters:quality(95)/images/story/11813/eybl_690w.jpg",
    ),
    SportNew(
      newTitle: "How reigning MVP Joel Embiid managed to make another leap",
      newText:
          "After finishing second in the NBA's Most-Valuable-Player voting in back-to-back years, Joel Embiid finally earned his MVP award last season.\n\nEmbiid had one of the best scoring seasons in NBA history, particularly by a big man, as he averaged the most points by a center since the 1980s. He made a significant leap forward, which wasn't necessarily expected given that he was already one of the most dominant players in the NBA.",
      newDate: DateTime(2023, 12, 13),
      newImage:
          "https://cdn.basketballnews.com/fit-in/1024x0/filters:strip_exif():filters:quality(95)/images/story/11812/joel2_690w.jpg",
    ),
    SportNew(
      newTitle: "The Dunk-tionary: The official guide to ranking dunks",
      newText:
          "It’s a random Wednesday. Full slate of games, hard to keep track of everything. Maybe you’re peeping an ESPN matchup. Perhaps you’re watching your favorite team on the local channel if you’re in the market, or you’re streaming it LEGALLY ON NBA LEAGUE PASS BECAUSE THAT IS THE ONLY WAY YOU ARE ALLOWED TO DO IT. WINK. \n\nBut anyway, you’re watching a game. You’re roaming Twitter. And then a tweet catches your eye: PLAYER X HAS DUNKED ON LEBRON JAMES.",
      newDate: DateTime(2023, 12, 12),
      newImage:
          "https://cdn.basketballnews.com/fit-in/1024x0/filters:strip_exif():filters:quality(95)/images/story/1388/tatum222_lg_690w.jpg",
    ),
  ];
}

class SportNew {
  const SportNew({
    required this.newTitle,
    required this.newText,
    required this.newDate,
    required this.newImage,
  });

  final String newTitle;
  final String newText;
  final DateTime newDate;
  final String newImage;
}
