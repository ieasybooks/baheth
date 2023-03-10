import LocalTime from "local-time-cdn";

LocalTime.config.i18n["ar"] = {
    date: {
        dayNames: ["الأحد", "الاثنين", "الثلاثاء", "الأربعاء", "الخميس", "الجمعة", "السبت"],
        abbrDayNames: ["الأحد", "الاثنين", "الثلاثاء", "الأربعاء", "الخميس", "الجمعة", "السبت"],
        monthNames: ["يناير", "فبراير", "مارس", "أبريل", "مايو", "يونيو", "يوليو", "أغسطس", "سبتمبر", "اكتوبر", "نوفمبر", "ديسمبر"],
        abbrMonthNames: ["يناير", "فبراير", "مارس", "أبريل", "مايو", "يونيو", "يوليو", "أغسطس", "سبتمبر", "اكتوبر", "نوفمبر", "ديسمبر"],
        yesterday: "الأمس",
        today: "اليوم",
        tomorrow: "الفد",
        on: "في {date}",
        formats: {
            "default": "%e %B، %Y",
            thisYear: "%b %e"
        }
    },
    time: {
        am: "صباحا",
        pm: "مساء",
        singular: "{time}",
        singularAn: "{time}",
        elapsed: "منذ {time}",
        second: "ثانية",
        seconds: "ثواني",
        minute: "دقيقة",
        minutes: "دقائق",
        hour: "ساعة",
        hours: "ساعات",
        formats: {
            "default": "%l:%M %P"
        }
    },
    datetime: {
        at: "{date} في {time}",
        formats: {
            "default": "%e %B، %Y في %l:%M %P %Z"
        }
    }
};

LocalTime.config.locale = "ar";

LocalTime.start();
