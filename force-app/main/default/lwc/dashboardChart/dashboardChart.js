import { LightningElement, wire } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import chartjs from '@salesforce/resourceUrl/chartjs';
import getEmailsPerDay from '@salesforce/apex/CadenceDashboardController.getEmailsPerDay';

export default class DashboardChart extends LightningElement {
    chart;
    chartJsLoaded = false;
    chartData;

    @wire(getEmailsPerDay)
    wiredData({ data }) {
        if (data) {
            this.chartData = data;
            if (this.chartJsLoaded) {
                this.drawChart();
            }
        }
    }

    renderedCallback() {
        if (this.chartJsLoaded) return;

        this.chartJsLoaded = true;

        loadScript(this, chartjs)
            .then(() => {
                if (this.chartData) {
                    this.drawChart();
                }
            })
            .catch(error => {
                console.error('ChartJS load error', error);
            });
    }

    drawChart() {
        const canvas = this.template.querySelector('canvas');
        const ctx = canvas.getContext('2d');

        const labels = Object.keys(this.chartData);
        const values = Object.values(this.chartData);

        if (this.chart) {
            this.chart.destroy();
        }

        this.chart = new window.Chart(ctx, {
            type: 'line',
            data: {
                labels,
                datasets: [{
                    label: 'Emails Sent',
                    data: values,
                    borderColor: '#0176D3',
                    backgroundColor: 'rgba(1,118,211,0.2)',
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    }
}