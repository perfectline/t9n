class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.column  :code,    :string,  :null => false, :limit => 5
      t.column  :name,    :string,  :null => false, :limit => 200
      t.column  :native,  :string, :null => false, :limit => 200
    end

    add_index :languages, :code, :unique => true

    Language.create!(
      :code   => "aa",
      :name   => "Afar",
      :native => "Afaraf")

    Language.create!(
      :code   => "ab",
      :name   => "Abkhazian",
      :native => "Аҧсуа")

    Language.create!(
      :code   => "ae",
      :name   => "Avestan",
      :native => "avesta")

    Language.create!(
      :code   => "af",
      :name   => "Afrikaans",
      :native => "Afrikaans")

    Language.create!(
      :code   => "ak",
      :name   => "Akan",
      :native => "Akan")

    Language.create!(
      :code   => "am",
      :name   => "Amharic",
      :native => "አማርኛ")

    Language.create!(
      :code   => "an",
      :name   => "Aragonese",
      :native => "Aragonés")

    Language.create!(
      :code   => "ar",
      :name   => "Arabic",
      :native => "العربية")

    Language.create!(
      :code   => "as",
      :name   => "Assamese",
      :native => "অসমীয়া")

    Language.create!(
      :code   => "av",
      :name   => "Avaric",
      :native => "авар мацӀ; магӀарул мацӀ")

    Language.create!(
      :code   => "ay",
      :name   => "Aymara",
      :native => "aymar aru")

    Language.create!(
      :code   => "az",
      :name   => "Azerbaijani",
      :native => "azərbaycan dili")

    Language.create!(
      :code   => "ba",
      :name   => "Bashkir",
      :native => "башҡорт теле")

    Language.create!(
      :code   => "be",
      :name   => "Belarusian",
      :native => "Беларуская")

    Language.create!(
      :code   => "bg",
      :name   => "Bulgarian",
      :native => "български език")

    Language.create!(
      :code   => "bh",
      :name   => "Bihari",
      :native => "भोजपुरी")

    Language.create!(
      :code   => "bi",
      :name   => "Bislama",
      :native => "Bislama")

    Language.create!(
      :code   => "bm",
      :name   => "Bambara",
      :native => "bamanankan")

    Language.create!(
      :code   => "bn",
      :name   => "Bengali",
      :native => "বাংলা")

    Language.create!(
      :code   => "bo",
      :name   => "Tibetan",
      :native => "བོད་ཡིག")

    Language.create!(
      :code   => "br",
      :name   => "Breton",
      :native => "brezhoneg")

    Language.create!(
      :code   => "bs",
      :name   => "Bosnian",
      :native => "bosanski jezik")

    Language.create!(
      :code   => "ca",
      :name   => "Catalan",
      :native => "Català")

    Language.create!(
      :code   => "ce",
      :name   => "Chechen",
      :native => "нохчийн мотт")

    Language.create!(
      :code   => "ch",
      :name   => "Chamorro",
      :native => "Chamoru")

    Language.create!(
      :code   => "co",
      :name   => "Corsican",
      :native => "corsu; lingua corsa")

    Language.create!(
      :code   => "cr",
      :name   => "Cree",
      :native => "ᓀᐦᐃᔭᐍᐏᐣ")

    Language.create!(
      :code   => "cs",
      :name   => "Czech",
      :native => "česky; čeština")

    Language.create!(
      :code   => "cu",
      :name   => "Church Slavic",
      :native => "ѩзыкъ словѣньскъ")

    Language.create!(
      :code   => "cv",
      :name   => "Chuvash",
      :native => "чӑваш чӗлхи")

    Language.create!(
      :code   => "cy",
      :name   => "Welsh",
      :native => "Cymraeg")

    Language.create!(
      :code   => "da",
      :name   => "Danish",
      :native => "dansk")

    Language.create!(
      :code   => "de",
      :name   => "German",
      :native => "Deutsch")

    Language.create!(
      :code   => "dv",
      :name   => "Divehi",
      :native => "ދިވެހި")

    Language.create!(
      :code   => "dz",
      :name   => "Dzongkha",
      :native => "རྫོང་ཁ")

    Language.create!(
      :code   => "ee",
      :name   => "Ewe",
      :native => "Ɛʋɛgbɛ")

    Language.create!(
      :code   => "el",
      :name   => "Greek",
      :native => "Ελληνικά")

    Language.create!(
      :code   => "en",
      :name   => "English",
      :native => "English")

    Language.create!(
      :code   => "eo",
      :name   => "Esperanto",
      :native => "Esperanto")

    Language.create!(
      :code   => "es",
      :name   => "Spanish",
      :native => "Español; castellano")

    Language.create!(
      :code   => "eu",
      :name   => "Basque",
      :native => "euskara; euskera")

    Language.create!(
      :code   => "fa",
      :name   => "Persian",
      :native => "فارسی")

    Language.create!(
      :code   => "ff",
      :name   => "Fulah",
      :native => "Fulfulde")

    Language.create!(
      :code   => "fi",
      :name   => "Finnish",
      :native => "suomi; suomen kieli")

    Language.create!(
      :code   => "fj",
      :name   => "Fijian",
      :native => "vosa Vakaviti")

    Language.create!(
      :code   => "fo",
      :name   => "Faroese",
      :native => "Føroyskt")

    Language.create!(
      :code   => "fy",
      :name   => "Western Frisian",
      :native => "Frysk")

    Language.create!(
      :code   => "ga",
      :name   => "Irish",
      :native => "Gaeilge")

    Language.create!(
      :code   => "gd",
      :name   => "Scottish Gaelic",
      :native => "Gàidhlig")

    Language.create!(
      :code   => "gl",
      :name   => "Galician",
      :native => "Galego")

    Language.create!(
      :code   => "gn",
      :name   => "Guaraní",
      :native => "Avañe'ẽ")

    Language.create!(
      :code   => "gu",
      :name   => "Gujarati",
      :native => "ગુજરાતી")

    Language.create!(
      :code   => "gv",
      :name   => "Manx",
      :native => "Gaelg; Gailck")

    Language.create!(
      :code   => "ha",
      :name   => "Hausa",
      :native => "هَوُسَ")

    Language.create!(
      :code   => "he",
      :name   => "Hebrew",
      :native => "עברית")

    Language.create!(
      :code   => "hi",
      :name   => "Hindi",
      :native => "हिन्दी; हिंदी")

    Language.create!(
      :code   => "ho",
      :name   => "Hiri Motu",
      :native => "Hiri Motu")

    Language.create!(
      :code   => "hr",
      :name   => "Croatian",
      :native => "Hrvatski")

    Language.create!(
      :code   => "ht",
      :name   => "Haitian",
      :native => "Kreyòl ayisyen")

    Language.create!(
      :code   => "hu",
      :name   => "Hungarian",
      :native => "Magyar")

    Language.create!(
      :code   => "hy",
      :name   => "Armenian",
      :native => "Հայերեն")

    Language.create!(
      :code   => "hz",
      :name   => "Herero",
      :native => "Otjiherero")

    Language.create!(
      :code   => "ia",
      :name   => "Interlingua (International Auxiliary Language Association)",
      :native => "Interlingua")

    Language.create!(
      :code   => "id",
      :name   => "Indonesian",
      :native => "Bahasa Indonesia")

    Language.create!(
      :code   => "ie",
      :name   => "Interlingue",
      :native => "Interlingue")

    Language.create!(
      :code   => "ig",
      :name   => "Igbo",
      :native => "Igbo")

    Language.create!(
      :code   => "ii",
      :name   => "Sichuan Yi",
      :native => "ꆇꉙ")

    Language.create!(
      :code   => "ik",
      :name   => "Inupiaq",
      :native => "Iñupiaq; Iñupiatun")

    Language.create!(
      :code   => "io",
      :name   => "Ido",
      :native => "Ido")

    Language.create!(
      :code   => "is",
      :name   => "Icelandic",
      :native => "Íslenska")

    Language.create!(
      :code   => "it",
      :name   => "Italian",
      :native => "Italiano")

    Language.create!(
      :code   => "iu",
      :name   => "Inuktitut",
      :native => "ᐃᓄᒃᑎᑐᑦ")

    Language.create!(
      :code   => "ja",
      :name   => "Japanese",
      :native => "日本語 (にほんご／にっぽんご)")

    Language.create!(
      :code   => "jv",
      :name   => "Javanese",
      :native => "basa Jawa")

    Language.create!(
      :code   => "ka",
      :name   => "Georgian",
      :native => "ქართული")

    Language.create!(
      :code   => "kg",
      :name   => "Kongo",
      :native => "KiKongo")

    Language.create!(
      :code   => "ki",
      :name   => "Kikuyu",
      :native => "Gĩkũyũ")

    Language.create!(
      :code   => "kj",
      :name   => "Kwanyama",
      :native => "Kuanyama")

    Language.create!(
      :code   => "kk",
      :name   => "Kazakh",
      :native => "Қазақ тілі")

    Language.create!(
      :code   => "kl",
      :name   => "Kalaallisut",
      :native => "kalaallisut; kalaallit oqaasii")

    Language.create!(
      :code   => "km",
      :name   => "Khmer",
      :native => "ភាសាខ្មែរ")

    Language.create!(
      :code   => "kn",
      :name   => "Kannada",
      :native => "ಕನ್ನಡ")

    Language.create!(
      :code   => "ko",
      :name   => "Korean",
      :native => "한국어 (韓國語); 조선말 (朝鮮語)")

    Language.create!(
      :code   => "kr",
      :name   => "Kanuri",
      :native => "Kanuri")

    Language.create!(
      :code   => "ks",
      :name   => "Kashmiri",
      :native => "कश्मीरी; كشميري‎")

    Language.create!(
      :code   => "ku",
      :name   => "Kurdish",
      :native => "Kurdî; كوردی‎")

    Language.create!(
      :code   => "kv",
      :name   => "Komi",
      :native => "коми кыв")

    Language.create!(
      :code   => "kw",
      :name   => "Cornish",
      :native => "Kernewek")

    Language.create!(
      :code   => "ky",
      :name   => "Kirghiz",
      :native => "кыргыз тили")

    Language.create!(
      :code   => "la",
      :name   => "Latin",
      :native => "latine; lingua latina")

    Language.create!(
      :code   => "lb",
      :name   => "Luxembourgish",
      :native => "Lëtzebuergesch")

    Language.create!(
      :code   => "lg",
      :name   => "Ganda",
      :native => "Luganda")

    Language.create!(
      :code   => "li",
      :name   => "Limburgish",
      :native => "Limburgs")

    Language.create!(
      :code   => "ln",
      :name   => "Lingala",
      :native => "Lingála")

    Language.create!(
      :code   => "lo",
      :name   => "Lao",
      :native => "ພາສາລາວ")

    Language.create!(
      :code   => "lt",
      :name   => "Lithuanian",
      :native => "lietuvių kalba")

    Language.create!(
      :code   => "lu",
      :name   => "Luba-Katanga",
      :native => "")

    Language.create!(
      :code   => "lv",
      :name   => "Latvian",
      :native => "latviešu valoda")

    Language.create!(
      :code   => "mg",
      :name   => "Malagasy",
      :native => "Malagasy fiteny")

    Language.create!(
      :code   => "mh",
      :name   => "Marshallese",
      :native => "Kajin M̧ajeļ")

    Language.create!(
      :code   => "mi",
      :name   => "Māori",
      :native => "te reo Māori")

    Language.create!(
      :code   => "mk",
      :name   => "Macedonian",
      :native => "македонски јазик")

    Language.create!(
      :code   => "ml",
      :name   => "Malayalam",
      :native => "മലയാളം")

    Language.create!(
      :code   => "mn",
      :name   => "Mongolian",
      :native => "Монгол")

    Language.create!(
      :code   => "mr",
      :name   => "Marathi",
      :native => "मराठी")

    Language.create!(
      :code   => "ms",
      :name   => "Malay",
      :native => "bahasa Melayu; بهاس ملايو‎")

    Language.create!(
      :code   => "mt",
      :name   => "Maltese",
      :native => "Malti")

    Language.create!(
      :code   => "my",
      :name   => "Burmese",
      :native => "ဗမာစာ")

    Language.create!(
      :code   => "na",
      :name   => "Nauru",
      :native => "Ekakairũ Naoero")

    Language.create!(
      :code   => "nb",
      :name   => "Norwegian Bokmål",
      :native => "Norsk bokmål")

    Language.create!(
      :code   => "nd",
      :name   => "North Ndebele",
      :native => "isiNdebele")

    Language.create!(
      :code   => "ne",
      :name   => "Nepali",
      :native => "नेपाली")

    Language.create!(
      :code   => "ng",
      :name   => "Ndonga",
      :native => "Owambo")

    Language.create!(
      :code   => "nl",
      :name   => "Dutch",
      :native => "Nederlands")

    Language.create!(
      :code   => "nn",
      :name   => "Norwegian Nynorsk",
      :native => "Norsk nynorsk")

    Language.create!(
      :code   => "no",
      :name   => "Norwegian",
      :native => "Norsk")

    Language.create!(
      :code   => "nr",
      :name   => "South Ndebele",
      :native => "isiNdebele")

    Language.create!(
      :code   => "nv",
      :name   => "Navajo",
      :native => "Diné bizaad; Dinékʼehǰí")

    Language.create!(
      :code   => "ny",
      :name   => "Chichewa",
      :native => "chiCheŵa; chinyanja")

    Language.create!(
      :code   => "oc",
      :name   => "Occitan",
      :native => "Occitan")

    Language.create!(
      :code   => "oj",
      :name   => "Ojibwa",
      :native => "ᐊᓂᔑᓈᐯᒧᐎᓐ")

    Language.create!(
      :code   => "om",
      :name   => "Oromo",
      :native => "Afaan Oromoo")

    Language.create!(
      :code   => "or",
      :name   => "Oriya",
      :native => "ଓଡ଼ିଆ")

    Language.create!(
      :code   => "os",
      :name   => "Ossetian",
      :native => "Ирон æвзаг")

    Language.create!(
      :code   => "pa",
      :name   => "Panjabi",
      :native => "ਪੰਜਾਬੀ; پنجابی‎")

    Language.create!(
      :code   => "pi",
      :name   => "Pāli",
      :native => "पाऴि")

    Language.create!(
      :code   => "pl",
      :name   => "Polish",
      :native => "polski")

    Language.create!(
      :code   => "ps",
      :name   => "Pashto",
      :native => "پښتو")

    Language.create!(
      :code   => "pt",
      :name   => "Portuguese",
      :native => "Português")

    Language.create!(
      :code   => "qu",
      :name   => "Quechua",
      :native => "Runa Simi; Kichwa")

    Language.create!(
      :code   => "rm",
      :name   => "Raeto-Romance",
      :native => "rumantsch grischun")

    Language.create!(
      :code   => "rn",
      :name   => "Kirundi",
      :native => "kiRundi")

    Language.create!(
      :code   => "ro",
      :name   => "Romanian",
      :native => "română")

    Language.create!(
      :code   => "ru",
      :name   => "Russian",
      :native => "русский язык")

    Language.create!(
      :code   => "rw",
      :name   => "Kinyarwanda",
      :native => "Ikinyarwanda")

    Language.create!(
      :code   => "sa",
      :name   => "Sanskrit",
      :native => "संस्कृतम्")

    Language.create!(
      :code   => "sc",
      :name   => "Sardinian",
      :native => "sardu")

    Language.create!(
      :code   => "sd",
      :name   => "Sindhi",
      :native => "सिन्धी; سنڌي، سندھی‎")

    Language.create!(
      :code   => "se",
      :name   => "Northern Sami",
      :native => "Davvisámegiella")

    Language.create!(
      :code   => "sg",
      :name   => "Sango",
      :native => "yângâ tî sängö")

    Language.create!(
      :code   => "sh",
      :name   => "Serbo-Croatian",
      :native => "Srpskohrvatski; Српскохрватски")

    Language.create!(
      :code   => "si",
      :name   => "Sinhala",
      :native => "සිංහල")

    Language.create!(
      :code   => "sk",
      :name   => "Slovak",
      :native => "slovenčina")

    Language.create!(
      :code   => "sl",
      :name   => "Slovenian",
      :native => "slovenščina")

    Language.create!(
      :code   => "sm",
      :name   => "Samoan",
      :native => "gagana fa'a Samoa")

    Language.create!(
      :code   => "sn",
      :name   => "Shona",
      :native => "chiShona")

    Language.create!(
      :code   => "so",
      :name   => "Somali",
      :native => "Soomaaliga; af Soomaali")

    Language.create!(
      :code   => "sq",
      :name   => "Albanian",
      :native => "Shqip")

    Language.create!(
      :code   => "sr",
      :name   => "Serbian",
      :native => "српски језик")

    Language.create!(
      :code   => "ss",
      :name   => "Swati",
      :native => "SiSwati")

    Language.create!(
      :code   => "st",
      :name   => "Southern Sotho",
      :native => "Sesotho")

    Language.create!(
      :code   => "su",
      :name   => "Sundanese",
      :native => "Basa Sunda")

    Language.create!(
      :code   => "sv",
      :name   => "Swedish",
      :native => "svenska")

    Language.create!(
      :code   => "sw",
      :name   => "Swahili",
      :native => "Kiswahili")

    Language.create!(
      :code   => "ta",
      :name   => "Tamil",
      :native => "தமிழ்")

    Language.create!(
      :code   => "te",
      :name   => "Telugu",
      :native => "తెలుగు")

    Language.create!(
      :code   => "tg",
      :name   => "Tajik",
      :native => "тоҷикӣ; toğikī; تاجیکی‎")

    Language.create!(
      :code   => "th",
      :name   => "Thai",
      :native => "ไทย")

    Language.create!(
      :code   => "ti",
      :name   => "Tigrinya",
      :native => "ትግርኛ")

    Language.create!(
      :code   => "tk",
      :name   => "Turkmen",
      :native => "Türkmen; Түркмен")

    Language.create!(
      :code   => "tl",
      :name   => "Tagalog",
      :native => "Tagalog")

    Language.create!(
      :code   => "tn",
      :name   => "Tswana",
      :native => "Setswana")

    Language.create!(
      :code   => "to",
      :name   => "Tonga",
      :native => "faka Tonga")

    Language.create!(
      :code   => "tr",
      :name   => "Turkish",
      :native => "Türkçe")

    Language.create!(
      :code   => "ts",
      :name   => "Tsonga",
      :native => "Xitsonga")

    Language.create!(
      :code   => "tt",
      :name   => "Tatar",
      :native => "татарча; tatarça; تاتارچا‎")

    Language.create!(
      :code   => "tw",
      :name   => "Twi",
      :native => "Twi")

    Language.create!(
      :code   => "ty",
      :name   => "Tahitian",
      :native => "Reo Mā`ohi")

    Language.create!(
      :code   => "ug",
      :name   => "Uighur",
      :native => "Uyƣurqə; ئۇيغۇرچە‎")

    Language.create!(
      :code   => "uk",
      :name   => "Ukrainian",
      :native => "Українська")

    Language.create!(
      :code   => "ur",
      :name   => "Urdu",
      :native => "اردو")

    Language.create!(
      :code   => "uz",
      :name   => "Uzbek",
      :native => "O'zbek; Ўзбек; أۇزبېك‎")

    Language.create!(
      :code   => "ve",
      :name   => "Venda",
      :native => "Tshivenḓa")

    Language.create!(
      :code   => "vi",
      :name   => "Vietnamese",
      :native => "Tiếng Việt")

    Language.create!(
      :code   => "vo",
      :name   => "Volapük",
      :native => "Volapük")

    Language.create!(
      :code   => "wa",
      :name   => "Walloon",
      :native => "Walon")

    Language.create!(
      :code   => "wo",
      :name   => "Wolof",
      :native => "Wollof")

    Language.create!(
      :code   => "xh",
      :name   => "Xhosa",
      :native => "isiXhosa")

    Language.create!(
      :code   => "yi",
      :name   => "Yiddish",
      :native => "ייִדיש")

    Language.create!(
      :code   => "yo",
      :name   => "Yoruba",
      :native => "Yorùbá")

    Language.create!(
      :code   => "za",
      :name   => "Zhuang",
      :native => "Saɯ cueŋƅ; Saw cuengh")

    Language.create!(
      :code   => "zh",
      :name   => "Chinese",
      :native => "中文 (Zhōngwén), 汉语, 漢語")

    Language.create!(
      :code   => "zu",
      :name   => "Zulu",
      :native => "isiZulu")

    Language.create!(
      :code   => "fr",
      :name   => "French",
      :native => "Français")

    Language.create!(
      :code   => "et",
      :name   => "Estonian",
      :native => " eesti keel")
  end

  def self.down
    drop_table :languages
  end
end

