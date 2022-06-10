import Vue from 'vue';
import formatDateFns from 'date-fns/format';

// @todo implement asynchronously loading?
import localeEn from 'date-fns/locale/en-GB';
import localeDe from 'date-fns/locale/de';


Vue.filter('formatDate', function(date : Date, format = 'yyyy-MM-dd hh:mm:ss') {
    if (typeof date === 'string') {
        date = new Date(date);
    }

    if (!(date instanceof Date) || isNaN(<any> date)) {
        return console.warn(typeof date + ' is not an instanceof Date');
    }

    let locale = {};

    switch (document.documentElement.lang) {
        case 'de':
            locale = localeDe;
            break;

        default:
            locale = localeEn;
    }

    return formatDateFns(date, format, { locale });
});
