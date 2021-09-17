import moment from 'moment';

export const enumerateDaysBetween = (start, end) => {
    const startDate = moment(start);
    const endDate = moment(end);
    const dates = [];
    while (startDate.isBefore(endDate) || startDate.isSame(endDate)) {
        dates.push(startDate.format('YYYY-MM-DD'));
        startDate.add(1, 'days');
    }
    return dates;
};
