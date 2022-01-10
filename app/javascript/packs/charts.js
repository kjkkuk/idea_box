import moment from "moment";
import Chart from "chart.js/auto";
import 'chartjs-adapter-moment';
import { enumerateDaysBetween } from '../helpers/helpers';

document.addEventListener('turbolinks:load', () => {
    const ctx = document.getElementById('myChart'); //.getContext('2d');
    // const radioBtns = document.querySelectorAll('input[type="radio"]');
    // let data = [];
    // fetch(`http://localhost:3000/period.json`)
    // const getDataForPeriod = (period = 'week') => {
    //     чё-то по типу fetch(`'твой ебучий урл'/?period=${period}`)
        // if (period === 'week') {
        //     data = new Array(7);
        // } else if (period === 'month') {
        //     data = new Array(30);
        // } else if (period === 'year') {
        //     data = new Array(365);
        // }
        // console.log(data)
    // };
    // window.addEventListener('load', () => getDataForPeriod());
    // const handleClick = e => getDataForPeriod(e.target.value);
    // radioBtns.forEach(i => i.addEventListener('change', handleClick));
    const myChart = new Chart(ctx, {
        type: 'line',
        // data: {
        //     labels: JSON.parse(ctx.dataset.labels),
        //     datasets: [{
        //         label: '# of Votes',
        //         data: JSON.parse(ctx.dataset.data),
        //         borderWidth: 1
        //     }]
        // },
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
