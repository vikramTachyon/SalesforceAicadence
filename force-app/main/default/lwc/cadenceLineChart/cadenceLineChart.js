import { LightningElement } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import chartjs from '@salesforce/resourceUrl/chartjs';

export default class CadenceLineChart extends LightningElement {

    chart;
    chartjsInitialized = false;

    renderedCallback() {
        if (this.chartjsInitialized) {
            return;
        }
        this.chartjsInitialized = true;

        loadScript(this, chartjs)
            .then(() => {
                const ctx = this.template.querySelector('canvas').getContext('2d');

                this.chart = new window.Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
                        datasets: [
                            {
                                label: 'Sent',
                                data: [120, 150, 200, 180, 240],
                                borderColor: '#1b96ff',
                                fill: false
                            },
                            {
                                label: 'Replied',
                                data: [10, 18, 25, 22, 35],
                                borderColor: '#2e844a',
                                fill: false
                            }
                        ]
                    }
                });
            })
            .catch(error => {
                console.error('Chart load failed', error);
            });
    }
}