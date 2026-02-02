import { LightningElement } from 'lwc';

export default class RecentActivities extends LightningElement {
    activities = [
        { id: 1, title: 'Replied: John', desc: 'Interested in demo', time: '1 hour ago' },
        { id: 2, title: 'Email Sent: Mike', desc: 'Follow-up sent', time: '3 hours ago' }
    ];
}