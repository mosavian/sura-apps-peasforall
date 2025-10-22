import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("fatiha") {
            dimension = "flavor-type"
            applicationId = "com.ario.fatiha"
            resValue(type = "string", name = "app_name", value = "سورة الفاتحة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1080299562")
        }
        create("baqareh") {
            dimension = "flavor-type"
            applicationId = "com.ario.baqareh"
            resValue(type = "string", name = "app_name", value = "سورة البقرة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4555647284")
        }
        create("emran") {
            dimension = "flavor-type"
            applicationId = "com.ario.emran"
            resValue(type = "string", name = "app_name", value = "سورة آل عمران")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8734663462")
        }
        create("nesa") {
            dimension = "flavor-type"
            applicationId = "com.ario.nesa"
            resValue(type = "string", name = "app_name", value = "سورة النساء")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8132548760")
        }
        create("maede") {
            dimension = "flavor-type"
            applicationId = "com.ario.maede"
            resValue(type = "string", name = "app_name", value = "سورة المائدة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1090845300")
        }
        create("anam") {
            dimension = "flavor-type"
            applicationId = "com.ario.anam"
            resValue(type = "string", name = "app_name", value = "سورة الأنعام")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6495694155")
        }
        create("eraf") {
            dimension = "flavor-type"
            applicationId = "com.ario.eraf"
            resValue(type = "string", name = "app_name", value = "سورة الأعراف")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1466249829")
        }
        create("enfal") {
            dimension = "flavor-type"
            applicationId = "com.ario.enfal"
            resValue(type = "string", name = "app_name", value = "سورة الأنفال")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6307512969")
        }
        create("tobeh") {
            dimension = "flavor-type"
            applicationId = "com.ario.tobeh"
            resValue(type = "string", name = "app_name", value = "سورة التوبة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5051596995")
        }
        create("yones") {
            dimension = "flavor-type"
            applicationId = "com.ario.yones"
            resValue(type = "string", name = "app_name", value = "سورة يونس")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4674581682")
        }
        create("hod") {
            dimension = "flavor-type"
            applicationId = "com.ario.hod"
            resValue(type = "string", name = "app_name", value = "سورة هود")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9435953775")
        }
        create("usef") {
            dimension = "flavor-type"
            applicationId = "com.ario.usef"
            resValue(type = "string", name = "app_name", value = "سورة يوسف")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9759387404")
        }
        create("raad") {
            dimension = "flavor-type"
            applicationId = "com.ario.raad"
            resValue(type = "string", name = "app_name", value = "سورة الرعد")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3441391068")
        }
        create("ebrahim") {
            dimension = "flavor-type"
            applicationId = "com.ario.ebrahim"
            resValue(type = "string", name = "app_name", value = "سورة إبراهيم")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4179757665")
        }
        create("hajar") {
            dimension = "flavor-type"
            applicationId = "com.ario.hajar"
            resValue(type = "string", name = "app_name", value = "سورة الحجر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4465385044")
        }
        create("nahl") {
            dimension = "flavor-type"
            applicationId = "com.ario.nahl"
            resValue(type = "string", name = "app_name", value = "سورة النحل")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2044548916")
        }
        create("esra") {
            dimension = "flavor-type"
            applicationId = "com.ario.esra"
            resValue(type = "string", name = "app_name", value = "سورة الإسراء")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8021486679")
        }
        create("kahf") {
            dimension = "flavor-type"
            applicationId = "com.ario.kahf"
            resValue(type = "string", name = "app_name", value = "سورة الكهف")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3725879361")
        }
        create("maryam") {
            dimension = "flavor-type"
            applicationId = "com.ario.maryam"
            resValue(type = "string", name = "app_name", value = "سورة مريم")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5910328653")
        }
        create("taha") {
            dimension = "flavor-type"
            applicationId = "com.ario.taha"
            resValue(type = "string", name = "app_name", value = "سورة طه")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8153348614")
        }
        create("anbya") {
            dimension = "flavor-type"
            applicationId = "com.ario.anbya"
            resValue(type = "string", name = "app_name", value = "سورة الأنبياء")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7405860269")
        }
        create("haj") {
            dimension = "flavor-type"
            applicationId = "com.ario.haj"
            resValue(type = "string", name = "app_name", value = "سورة الحج")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1952193344")
        }
        create("momenon") {
            dimension = "flavor-type"
            applicationId = "com.ario.momenon"
            resValue(type = "string", name = "app_name", value = "سورة المؤمنون")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4485829679")
        }
        create("nor") {
            dimension = "flavor-type"
            applicationId = "com.ario.nor"
            resValue(type = "string", name = "app_name", value = "سورة النور")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9235786990")
        }
        create("forghan") {
            dimension = "flavor-type"
            applicationId = "com.ario.forghan"
            resValue(type = "string", name = "app_name", value = "سورة الفرقان")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6246661577")
        }
        create("shoara") {
            dimension = "flavor-type"
            applicationId = "com.ario.shoara"
            resValue(type = "string", name = "app_name", value = "سورة الشعراء")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6765536326")
        }
        create("naml") {
            dimension = "flavor-type"
            applicationId = "com.ario.naml"
            resValue(type = "string", name = "app_name", value = "سورة النمل")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8816984593")
        }
        create("ghesas") {
            dimension = "flavor-type"
            applicationId = "com.ario.ghesas"
            resValue(type = "string", name = "app_name", value = "سورة القصص")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4655817652")
        }
        create("ankaboot") {
            dimension = "flavor-type"
            applicationId = "com.ario.ankaboot"
            resValue(type = "string", name = "app_name", value = "سورة العنكبوت")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3431393563")
        }
        create("rom") {
            dimension = "flavor-type"
            applicationId = "com.ario.rom"
            resValue(type = "string", name = "app_name", value = "سورة الروم")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7179066888")
        }
        create("loghman") {
            dimension = "flavor-type"
            applicationId = "com.ario.loghman"
            resValue(type = "string", name = "app_name", value = "سورة لقمان")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6987495192")
        }
        create("sajdeh") {
            dimension = "flavor-type"
            applicationId = "com.ario.sajdeh"
            resValue(type = "string", name = "app_name", value = "سورة السجدة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7539526516")
        }
        create("ahzab") {
            dimension = "flavor-type"
            applicationId = "com.ario.ahzab"
            resValue(type = "string", name = "app_name", value = "سورة الأحزاب")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2751369738")
        }
        create("saba") {
            dimension = "flavor-type"
            applicationId = "com.ario.saba"
            resValue(type = "string", name = "app_name", value = "سورة سبأ")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3489736333")
        }
        create("fater") {
            dimension = "flavor-type"
            applicationId = "com.ario.fater"
            resValue(type = "string", name = "app_name", value = "سورة فاطر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5013543320")
        }
        create("yasin") {
            dimension = "flavor-type"
            applicationId = "com.ario.yasin"
            resValue(type = "string", name = "app_name", value = "سورة يس")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2255351189")
        }
        create("safat") {
            dimension = "flavor-type"
            applicationId = "com.ario.safat"
            resValue(type = "string", name = "app_name", value = "سورة الصافات")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4387406105")
        }
        create("sad") {
            dimension = "flavor-type"
            applicationId = "com.ario.sad"
            resValue(type = "string", name = "app_name", value = "سورة ص")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2882752743")
        }
        create("zmr") {
            dimension = "flavor-type"
            applicationId = "com.ario.zmr"
            resValue(type = "string", name = "app_name", value = "سورة الزمر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5816516770")
        }
        create("qafr") {
            dimension = "flavor-type"
            applicationId = "com.ario.qafr"
            resValue(type = "string", name = "app_name", value = "سورة غافر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9499583245")
        }
        create("fslat") {
            dimension = "flavor-type"
            applicationId = "com.ario.fslat"
            resValue(type = "string", name = "app_name", value = "سورة فصلت")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7368792663")
        }
        create("shora") {
            dimension = "flavor-type"
            applicationId = "com.ario.shora"
            resValue(type = "string", name = "app_name", value = "سورة الشورى")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6310382930")
        }
        create("zkhrf") {
            dimension = "flavor-type"
            applicationId = "com.ario.zkhrf"
            resValue(type = "string", name = "app_name", value = "سورة الزخرف")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3736739229")
        }
        create("dokhan") {
            dimension = "flavor-type"
            applicationId = "com.ario.dokhan"
            resValue(type = "string", name = "app_name", value = "سورة الدخان")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3231787860")
        }
        create("jasieh") {
            dimension = "flavor-type"
            applicationId = "com.ario.jasieh"
            resValue(type = "string", name = "app_name", value = "سورة الجاثية")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9780716479")
        }
        create("ahghaf") {
            dimension = "flavor-type"
            applicationId = "com.ario.ahghaf"
            resValue(type = "string", name = "app_name", value = "سورة الأحقاف")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4553087327")
        }
        create("mhmd") {
            dimension = "flavor-type"
            applicationId = "com.ario.mhmd"
            resValue(type = "string", name = "app_name", value = "سورة محمد")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7906729156")
        }
        create("fath") {
            dimension = "flavor-type"
            applicationId = "com.ario.fath"
            resValue(type = "string", name = "app_name", value = "سورة الفتح")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9995311226")
        }
        create("hojrat") {
            dimension = "flavor-type"
            applicationId = "com.ario.hojrat"
            resValue(type = "string", name = "app_name", value = "سورة الحجرات")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7892919736")
        }
        create("ghaf") {
            dimension = "flavor-type"
            applicationId = "com.ario.ghaf"
            resValue(type = "string", name = "app_name", value = "سورة ق")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2396571542")
        }
        create("zariyat") {
            dimension = "flavor-type"
            applicationId = "com.ario.zariyat"
            resValue(type = "string", name = "app_name", value = "سورة الذاريات")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1296368593")
        }
        create("tor") {
            dimension = "flavor-type"
            applicationId = "com.ario.tor"
            resValue(type = "string", name = "app_name", value = "سورة الطور")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2197739921")
        }
        create("najm") {
            dimension = "flavor-type"
            applicationId = "com.ario.najm"
            resValue(type = "string", name = "app_name", value = "سورة النجم")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3521214867")
        }
        create("ghamar") {
            dimension = "flavor-type"
            applicationId = "com.ario.ghamar"
            resValue(type = "string", name = "app_name", value = "سورة القمر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9317203115")
        }
        create("alrahman") {
            dimension = "flavor-type"
            applicationId = "com.ario.alrahman"
            resValue(type = "string", name = "app_name", value = "سورة الرحمن")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7365590522")
        }
        create("vaqee") {
            dimension = "flavor-type"
            applicationId = "com.ario.vaqee"
            resValue(type = "string", name = "app_name", value = "سورة الواقعة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9200033485")
        }
        create("hadid") {
            dimension = "flavor-type"
            applicationId = "com.ario.hadid"
            resValue(type = "string", name = "app_name", value = "سورة الحديد")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4064876432")
        }
        create("mojadl") {
            dimension = "flavor-type"
            applicationId = "com.ario.mojadl"
            resValue(type = "string", name = "app_name", value = "سورة المجادلة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4039442815")
        }
        create("hashr") {
            dimension = "flavor-type"
            applicationId = "com.ario.hashr"
            resValue(type = "string", name = "app_name", value = "سورة الحشر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2634625136")
        }
        create("momtahn") {
            dimension = "flavor-type"
            applicationId = "com.ario.momtahn"
            resValue(type = "string", name = "app_name", value = "سورة الممتحنة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9349611252")
        }
        create("saf") {
            dimension = "flavor-type"
            applicationId = "com.ario.saf"
            resValue(type = "string", name = "app_name", value = "سورة الصف")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9687209528")
        }
        create("jome") {
            dimension = "flavor-type"
            applicationId = "com.ario.jome"
            resValue(type = "string", name = "app_name", value = "سورة الجمعة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5069216782")
        }
        create("mnfghn") {
            dimension = "flavor-type"
            applicationId = "com.ario.mnfghn"
            resValue(type = "string", name = "app_name", value = "سورة المنافقون")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4791225627")
        }
        create("tghbn") {
            dimension = "flavor-type"
            applicationId = "com.ario.tghbn"
            resValue(type = "string", name = "app_name", value = "سورة التغابن")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4380162083")
        }
        create("talagh") {
            dimension = "flavor-type"
            applicationId = "com.ario.talagh"
            resValue(type = "string", name = "app_name", value = "سورة الطلاق")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5592844431")
        }
        create("tahrim") {
            dimension = "flavor-type"
            applicationId = "com.ario.tahrim"
            resValue(type = "string", name = "app_name", value = "سورة التحريم")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4212641124")
        }
        create("molk") {
            dimension = "flavor-type"
            applicationId = "com.ario.molk"
            resValue(type = "string", name = "app_name", value = "سورة الملك")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4707282372")
        }
        create("qlm") {
            dimension = "flavor-type"
            applicationId = "com.ario.qlm"
            resValue(type = "string", name = "app_name", value = "سورة القلم")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8541648810")
        }
        create("haqe") {
            dimension = "flavor-type"
            applicationId = "com.ario.haqe"
            resValue(type = "string", name = "app_name", value = "سورة الحاقة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6741428086")
        }
        create("mraj") {
            dimension = "flavor-type"
            applicationId = "com.ario.mraj"
            resValue(type = "string", name = "app_name", value = "سورة المعارج")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3923693053")
        }
        create("noh") {
            dimension = "flavor-type"
            applicationId = "com.ario.noh"
            resValue(type = "string", name = "app_name", value = "سورة نوح")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6823041334")
        }
        create("jen") {
            dimension = "flavor-type"
            applicationId = "com.ario.jen"
            resValue(type = "string", name = "app_name", value = "سورة الجن")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2627811300")
        }
        create("mozamel") {
            dimension = "flavor-type"
            applicationId = "com.ario.mozamel"
            resValue(type = "string", name = "app_name", value = "سورة المزمل")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6654644669")
        }
        create("mdser") {
            dimension = "flavor-type"
            applicationId = "com.ario.mdser"
            resValue(type = "string", name = "app_name", value = "سورة المدثر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2111917931")
        }
        create("ghiyamt") {
            dimension = "flavor-type"
            applicationId = "com.ario.ghiyamt"
            resValue(type = "string", name = "app_name", value = "سورة القيامة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2046191521")
        }
        create("nsan") {
            dimension = "flavor-type"
            applicationId = "com.ario.nsan"
            resValue(type = "string", name = "app_name", value = "سورة الإنسان")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2734734469")
        }
        create("mrslt") {
            dimension = "flavor-type"
            applicationId = "com.ario.mrslt"
            resValue(type = "string", name = "app_name", value = "سورة المرسلات")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3473101062")
        }
        create("naba") {
            dimension = "flavor-type"
            applicationId = "com.ario.naba"
            resValue(type = "string", name = "app_name", value = "سورة النبأ")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6053471874")
        }
        create("nazat") {
            dimension = "flavor-type"
            applicationId = "com.ario.nazat"
            resValue(type = "string", name = "app_name", value = "سورة النازعات")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7425977884")
        }
        create("abas") {
            dimension = "flavor-type"
            applicationId = "com.ario.abas"
            resValue(type = "string", name = "app_name", value = "سورة عبس")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7156662370")
        }
        create("takwir") {
            dimension = "flavor-type"
            applicationId = "com.ario.takwir"
            resValue(type = "string", name = "app_name", value = "سورة التكوير")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3446655689")
        }
        create("nftar") {
            dimension = "flavor-type"
            applicationId = "com.ario.nftar"
            resValue(type = "string", name = "app_name", value = "سورة الإنفطار")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3946183286")
        }
        create("mtffin") {
            dimension = "flavor-type"
            applicationId = "com.ario.mtffin"
            resValue(type = "string", name = "app_name", value = "سورة المطففين")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9754905552")
        }
        create("nshqaq") {
            dimension = "flavor-type"
            applicationId = "com.ario.nshqaq"
            resValue(type = "string", name = "app_name", value = "سورة الإنشقاق")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2363500694")
        }
        create("broj") {
            dimension = "flavor-type"
            applicationId = "com.ario.broj"
            resValue(type = "string", name = "app_name", value = "سورة البروج")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4031805586")
        }
        create("taregh") {
            dimension = "flavor-type"
            applicationId = "com.ario.taregh"
            resValue(type = "string", name = "app_name", value = "سورة الطارق")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4405062871")
        }
        create("ala") {
            dimension = "flavor-type"
            applicationId = "com.ario.ala"
            resValue(type = "string", name = "app_name", value = "سورة الأعلى")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6839654525")
        }
        create("qashie") {
            dimension = "flavor-type"
            applicationId = "com.ario.qashie"
            resValue(type = "string", name = "app_name", value = "سورة الغاشية")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3064061045")
        }
        create("fajr") {
            dimension = "flavor-type"
            applicationId = "com.ario.fajr"
            resValue(type = "string", name = "app_name", value = "سورة الفجر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8611901198")
        }
        create("balad") {
            dimension = "flavor-type"
            applicationId = "com.ario.balad"
            resValue(type = "string", name = "app_name", value = "سورة البلد")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3908516655")
        }
        create("shams") {
            dimension = "flavor-type"
            applicationId = "com.ario.shams"
            resValue(type = "string", name = "app_name", value = "سورة الشمس")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3525373270")
        }
        create("layl") {
            dimension = "flavor-type"
            applicationId = "com.ario.layl"
            resValue(type = "string", name = "app_name", value = "سورة الليل")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1140605285")
        }
        create("zoha") {
            dimension = "flavor-type"
            applicationId = "com.ario.zoha"
            resValue(type = "string", name = "app_name", value = "سورة الضحى")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6698331525")
        }
        create("sharh") {
            dimension = "flavor-type"
            applicationId = "com.ario.sharh"
            resValue(type = "string", name = "app_name", value = "سورة الشرح")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6698331525")   
        }
        create("tin") {
            dimension = "flavor-type"
            applicationId = "com.ario.tin"
            resValue(type = "string", name = "app_name", value = "سورة التين")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2258074894")
        }
        create("alaq") {
            dimension = "flavor-type"
            applicationId = "com.ario.alaq"
            resValue(type = "string", name = "app_name", value = "سورة العلق")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7662444811")
        }
        create("qadr") {
            dimension = "flavor-type"
            applicationId = "com.ario.qadr"
            resValue(type = "string", name = "app_name", value = "سورة القدر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1041196145")
        }
        create("bayyina") {
            dimension = "flavor-type"
            applicationId = "com.ario.bayyina"
            resValue(type = "string", name = "app_name", value = "سورة البينة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7889675522")
        }
        create("zalzalah") {
            dimension = "flavor-type"
            applicationId = "com.ario.zalzalah"
            resValue(type = "string", name = "app_name", value = "سورة الزلزلة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3388157883")
        }
        create("adiyat") {
            dimension = "flavor-type"
            applicationId = "com.ario.adiyat"
            resValue(type = "string", name = "app_name", value = "سورة العاديات")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~7031889420")
        }
        create("qariah") {
            dimension = "flavor-type"
            applicationId = "com.ario.qariah"
            resValue(type = "string", name = "app_name", value = "سورة القارعة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4318096178")
        }
        create("takathur") {
            dimension = "flavor-type"
            applicationId = "com.ario.takathur"
            resValue(type = "string", name = "app_name", value = "سورة التكاثر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6129871298")
        }
        create("asr") {
            dimension = "flavor-type"
            applicationId = "com.ario.asr"
            resValue(type = "string", name = "app_name", value = "سورة العصر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5335664371")
        }
        create("humazah") {
            dimension = "flavor-type"
            applicationId = "com.ario.humazah"
            resValue(type = "string", name = "app_name", value = "سورة الهمزة")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~5363584535")
        }
        create("fil") {
            dimension = "flavor-type"
            applicationId = "com.ario.fil"
            resValue(type = "string", name = "app_name", value = "سورة الفيل")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8797355092")
        }
        create("quraysh") {
            dimension = "flavor-type"
            applicationId = "com.ario.quraysh"
            resValue(type = "string", name = "app_name", value = "سورة قريش")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8697799664")
        }
        create("maun") {
            dimension = "flavor-type"
            applicationId = "com.ario.maun"
            resValue(type = "string", name = "app_name", value = "سورة الماعون")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~6812397579")
        }
        create("kawthar") {
            dimension = "flavor-type"
            applicationId = "com.ario.kawthar"
            resValue(type = "string", name = "app_name", value = "سورة الكوثر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~9055417532")
        }
        create("kafirun") {
            dimension = "flavor-type"
            applicationId = "com.ario.kafirun"
            resValue(type = "string", name = "app_name", value = "سورة الكافرون")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1002625554")
        }
        create("nasr") {
            dimension = "flavor-type"
            applicationId = "com.ario.nasr"
            resValue(type = "string", name = "app_name", value = "سورة النصر")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~2667061016")
        }
        create("masad") {
            dimension = "flavor-type"
            applicationId = "com.ario.masad"
            resValue(type = "string", name = "app_name", value = "سورة المسد")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~1162407650")
        }
        create("ikhlas") {
            dimension = "flavor-type"
            applicationId = "com.ario.ikhlas"
            resValue(type = "string", name = "app_name", value = "سورة الإخلاص")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~3469523713")
        }
        create("falaq") {
            dimension = "flavor-type"
            applicationId = "com.ario.falaq"
            resValue(type = "string", name = "app_name", value = "سورة الفلق")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~8075300365")
        }
        create("nas") {
            dimension = "flavor-type"
            applicationId = "com.ario.nas"
            resValue(type = "string", name = "app_name", value = "سورة الناس")
            resValue(type = "string", name = "admob_app_id", value = "ca-app-pub-7477781478326336~4918336758")
        }
    }
}