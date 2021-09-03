import moment from "moment";
import Chart from "chart.js/auto";
import 'chartjs-adapter-moment';
import { enumerateDaysBetween } from '../helpers/helpers';

document.addEventListener('turbolinks:load', () => {
    const ctx = document.getElementById('myChart').getContext('2d');
    const startDate = moment().format('YYYY-MM-DD');
    const endDate = moment(startDate).add(6, 'days').format('YYYY-MM-DD');
    const data = {
        labels: enumerateDaysBetween(startDate, endDate),
        datasets: [{
            data: [12, 19, 3, 5, 2, 3, 4],
        }],
    }
    const myChart = new Chart(ctx, {
        type: 'line',
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false,
                },
                title: {
                    display: false,
                },
            },
            interaction: {
                intersect: false,
            },
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: 'day',
                        displayFormats: {
                            day: 'YYYY-MM-DD',
                        },
                    },
                    display: true,
                    title: {
                        display: true,
                    },
                    ticks: {
                        maxRotation: 0,
                    },
                },
                y: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Team Members',
                    },
                    suggestedMin: 0,
                }
            }
        },
        data,
    });
});
