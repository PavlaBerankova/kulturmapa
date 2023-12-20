import Foundation

struct Events: Codable {
    var events: [Event]

    enum CodingKeys: String, CodingKey {
        case events = "features"
    }
}

extension Events {
    static let mock: Events = Events(
        events: [
            Event(
                attributes: EventAttributes(
                    categories: nil,
                    id: 207_276,
                    name: "Člověk, smrtelná osobnost a nesmrtelné jádro",
                    text: "Srdečně zveme veřejnost na přednášku.Zkoumání cesty sebeobjevení.Transformace vědomí.Příběh o obyvateli nesmrtelného domu – na motivy knihy Jan Naposlednarozený.Jan Naposlednarozený je příběh jednoho mladého muže, který zdědil venkovský statek, k němuž se váže zvláštní příkaz. Ten je následující:Změň dům podle původního plánu znění,prostorům všem je třeba obnovení.Na první pohled to vypadá jako jednoduchý úkol, avšak když se Jan plný elánu do toho pustí, nemá ještě nejmenší tušení, jaké dalekosáhlé následky to bude mít.Jan Naposlednarozený je symbolické vyprávění a rovněž jméno je symbolický vzor. Ale může to být příběh každého, kdo je odhodlán a připraven od základu opravit a obnovit svůj život a zaměřit se na siločáry toho Jediného Světla.",
                    tickets: "Zdarma - ",
                    ticketsInfo: nil,
                    image: URL(string: "https://www.gotobrno.cz/wp-content/uploads/2017/07/brno-panorama.jpg"),
                    url: "https://www.gotobrno.cz/akce/clovek-smrtelna-osobnost-a-nesmrtelne-jadro/",
                    email: "kancelar.rosicrucianum@gmail.com",
                    ticketsUrl: nil,
                    timeStampFrom: 1_698_796_800_000,
                    timeStampTo: 1_698_796_800_000),
                geometry:
                    EventPoint(
                        latitude: 49.19395161949479,
                        longitude: 16.612533945669817)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno, Veletrhy / vzdělávací",
                    id: 183_027,
                    name: "Prohlídky Brna pro školy – V interiéru",
                    text: nil,
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/wp-content/uploads/2023/02/obecne-s-detmi-a-pruvodcem-4-min-scaled.jpg",
                    email: "skolniprohlidky@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno, Veletrhy / vzdělávací",
                    id: 182_804,
                    name: "Prohlídky Brna pro školy – Naše klasika",
                    text: nil,
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/prohlidky-brna-pro-skoly-nase-klasika/",
                    email: "skolniprohlidky@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno, Veletrhy / vzdělávací",
                    id: 182_796,
                    name: "Prohlídky Brna pro školy",
                    text: nil,
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/pruvodcovske-sluzby-prohlidky-brna-pro-skoly/",
                    email: "skolniprohlidky@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: nil,
                    id: 101_497,
                    name: "Průvodcovské služby – Tematické okruhy",
                    text: nil,
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/pruvodcovske-sluzby-tematicke-okruhy/",
                    email: "pecinkova@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno, Veletrhy / vzdělávací",
                    id: 183_031,
                    name: "Prohlídky Brna pro školy – Další nabídka",
                    text: nil,
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/prohlidky-brna-pro-skoly-dalsi-nabidka/",
                    email: "skolniprohlidky@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno, Veletrhy / vzdělávací",
                    id: 105_889,
                    name: "Průvodcovské služby na objednávku",
                    text: nil,
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/pruvodcovske-sluzby-na-objednavku/",
                    email: "pecinkova@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno",
                    id: 101_444,
                    name: "Poznávejte město s průvodcem",
                    text: "Autentické prohlídky",
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/poznavejte-mesto-s-pruvodcem/",
                    email: "info@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno, Pro rodiny, Veletrhy / vzdělávací",
                    id: 105_725,
                    name: "Autentické prohlídky",
                    text: nil,
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/pruvodcovske-sluzby-autenticke-prohlidky/",
                    email: "uricarova@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno, Veletrhy / vzdělávací",
                    id: 183_022,
                    name: "Prohlídky Brna pro školy – Speciální prohlídky",
                    text: nil,
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/prohlidky-brna-pro-skoly-specialni-prohlidky/",
                    email: "uricarova@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Folklor, Hudba",
                    id: 204_511,
                    name: "Co Javorník, to muzikant",
                    text: "Jedinečný koncert souboru Javorník Brno a&nbsp;jeho tří současných muzik, zpěváků i&nbsp;malých tanečních forem.Spoluúčinkují Jindřich Hovorka ml., Petr Ryšavý, Magdalena Říčná, Ludvík Běťák, Michaela Šilhavíková, Jaroslav Píštěk, ženský i&nbsp;mužský sbor souboru a&nbsp;další. Samotný koncert bude nejen o&nbsp;hudebním projevu, ale bude také prokládaný malými tanečními formami tanečníků z&nbsp;FS Javorník.",
                    tickets: "Dospělí - 350Kč",
                    ticketsInfo: "Jednotná cena za místenku.",
                    image: URL(string: "https://www.gotobrno.cz/wp-content/uploads/2023/02/obecne-s-detmi-a-pruvodcem-4-min-scaled.jpg"),
                    url: "https://www.gotobrno.cz/akce/co-javornik-to-muzikant-2/",
                    email: "info@javornikbrno.cz",
                    ticketsUrl: "https://goout.net/cs/listky/javornik/vhbt/",
                    timeStampFrom: 1_623_974_400_000,
                    timeStampTo: 1_861_920_000_000),
                geometry:
                    EventPoint(
                        latitude: 49.2095699547947,
                        longitude: 16.5888674968201)
            ),
            Event(
                attributes: EventAttributes(
                    categories: "Akce TIC Brno, Veletrhy / vzdělávací",
                    id: 101_490,
                    name: "Průvodcovské služby – Základní okruhy",
                    text: nil,
//                    text: "Základní okruhy vás během jedné procházky seznámí se všemi hlavními památkami či místy v&nbsp;centru města, a&nbsp;to v&nbsp;mnoha světových jazycích. Ve spolupráci s průvodci, kteří jsou členy Asociace průvodců ČR, nabízíme 2 nebo 3hodinovou základní trasu.Vybírat můžete z 2hodinových okruhů Poprvé v Brně a&nbsp;Brněnské pověsti a&nbsp;zajímavosti nebo z okruhů 3hodinových To NEJ z Brna a&nbsp;Brno z širšího pohledu.Poprvé v&nbsp;Brně / 2 hodinyBěhem této prohlídky vás průvodce seznámí s&nbsp;hlavními památkami v&nbsp;centru města. Můžete tak obdivovat pozoruhodná brněnská náměstí, prohlédnout si monumentální katedrálu sv. Petra a&nbsp;Pavla nebo si vyslechnout nejznámější brněnské pověsti.Trasa:Stará radnice – nádvoří, brněnský drak, portálZelný trh – barokní kašna Parnas, Divadlo Reduta, socha W. A. Mozarta, sloup Nejsvětější trojice, Dietrichsteinský palácKapucínské náměstíKatedrála sv. Petra a&nbsp;Pavla (včetně interiéru)Denisovy sady – obelisk, výhled na Špilberk, Staré Brno a&nbsp;kostel J. A. Komenského (Červený kostel)Náměstí Svobody – Kleinův palác, Dům pánů z&nbsp;Lipé, budova Moravské banky, morový sloup, hodinový strojKostel sv. Jakuba (včetně interiéru)Moravské náměstí – kostel sv. Tomáše, Místodržitelský palác, sochy 4 Platónových ctnostíBěhem této trasy se nevstupuje do objektů, není-li uvedeno jinak.Detail trasyBrněnské pověsti a&nbsp;zajímavosti / 2 hodinyTuto prohlídku historického centra doporučujeme všem zájemcům o&nbsp;mystiku, legendy a&nbsp;pověsti. Na trase se seznámíte se známými i&nbsp;méně známými brněnskými pověstmi. Pomůžeme vám také objevit drobnosti a&nbsp;zajímavosti, kterých si při běžném procházení ulicemi nevšimnete.Trasa:Stará radnice – nádvoří, brněnský drak, portálOrlí ulice – Dům u&nbsp;kamenné pannyKapucínské náměstí – Kapucínská hrobka, kostel Nalezení svatého KřížeZelný trh – barokní kašna Parnas, Divadlo Reduta, socha W. A. Mozarta, sloup Nejsvětější trojice, Dietrichsteinský palácKatedrála sv. Petra a&nbsp;Pavla (včetně interiéru)Denisovy sady – obelisk, výhled na Špilberk, Staré Brno a&nbsp;kostel J. A. Komenského (Červený kostel)Mečová uliceDominikánské náměstí – Nová radniceNáměstí Svobody – Kleinův palác, Dům pánů z&nbsp;Lipé, hodinový strojKostel sv. Jakuba (včetně interiéru)Moravské náměstí – sochy 4 Platónových ctnostíBěhem této trasy se nevstupuje do objektů, není-li uvedeno jinak.Detail trasyTo NEJ z&nbsp;centra Brna / 3 hodinyBěhem této prohlídky poznáte nejen centrum města, ale také mohutný hrad Špilberk tyčící se na kopci nad Brnem jako pomník dávné vojenské slávy či připomínka těžkého žalářnictví. Hrad navíc nabízí skvělý výhled na celé město i&nbsp;na nejvyšší budovu v&nbsp;Brně. Poznáte tak nejlépe Brno historické i&nbsp;současné. Na Špilberku sídlí Muzeum města Brna. Návštěva expozic není součástí prohlídky.Trasa:Stará radnice – nádvoří, brněnský drak, portálZelný trh – barokní kašna Parnas, Divadlo Reduta, socha W. A. Mozarta, sloup Nejsvětější trojice, Dietrichsteinský palácKatedrála sv. Petra a&nbsp;Pavla (včetně interiéru)Kapucínské náměstíNáměstí Svobody – Kleinův palác, Dům pánů z&nbsp;Lipé, budova Moravské banky, morový sloup, hodinový strojKostel sv. Jakuba (včetně interiéru)Moravské náměstí – kostel sv. Tomáše, Místodržitelský palác, sochy 4 Platónových ctnostíHrad Špilberk – busta Raduita de Souches, velké nádvoří, vyhlídková místaBěhem této trasy se nevstupuje do objektů, není-li uvedeno jinak.Detail trasyBrno z&nbsp;širšího pohledu / 3 hodinySkupinám s&nbsp;vlastním autobusem doporučujeme tuto kombinovanou prohlídku. Procházka v&nbsp;pěší zóně v&nbsp;centru města je doplněna okružní jízdou kolem míst, která stojí za to turistům také ukázat (např. park Lužánky, vila Löw-Beer, bazilika Nanebevzetí Panny Marie, Mendelovo muzeum, Pivovar Starobrno, brněnské výstaviště atd.)Během této trasy se nevstupuje do objektů, není-li uvedeno jinak.Trasy lze změnit dle požadavků klienta.CENÍK V&nbsp;ČESKÉM JAZYCEPočet osobDélka 2 hodinyDélka 3 hodinyskupina do 4 osob1000&nbsp;Kč1400&nbsp;Kčskupina 5-14 osob1400&nbsp;Kč1800&nbsp;Kčskupina 15-24 osob1800&nbsp;Kč2300&nbsp;Kčskupina 25-45 osob2300&nbsp;Kč2900&nbsp;KčUvedené ceny jsou za celou skupinu a&nbsp;neobsahují vstupné do objektů.CENÍK V&nbsp;CIZÍM JAZYCEPočet osobDélka 2 hodinyDélka 3 hodinyskupina do 4 osob1300 CZK / 52 EUR1800 CZK / 72 EURskupina 5-14 osob1800 CZK / 72 EUR2300 CZK / 92 EURskupina 15-24 osob2300 CZK / 92 EUR2900 CZK / 116 EURskupina 25-45 osob2900 CZK / 116 EUR3900 CZK / 156 EURStorno poplatky:den před objednaným termínem 50&nbsp;% z&nbsp;cenyv den konání prohlídky 100&nbsp;% z&nbsp;cenyVýklad zajistíme v&nbsp;těchto jazycích:anglický, německý, italský, francouzský, španělský, ruský, polský, maďarský, ukrajinský, chorvatský, portugalský, holandský, čínský a&nbsp;japonský.",
                    tickets: nil,
                    ticketsInfo: nil,
                    image: URL(string: "https://picsum.photos/200"),
                    url: "https://www.gotobrno.cz/akce/pruvodcovske-sluzby-zakladni-okruhy/",
                    email: "pecinkova@ticbrno.cz",
                    ticketsUrl: nil,
                    timeStampFrom: 1_609_459_200_000,
                    timeStampTo: 2_556_057_600_000),
                geometry:
                    EventPoint(
                        latitude: 49.19505099999999,
                        longitude: 16.608123)
            )
        ]
    )
}
